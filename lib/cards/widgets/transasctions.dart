import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rpay/cards/models/transactions.dart';
import 'dart:math';
import 'package:rpay/login/providers/login_user_provider.dart';
import '../utils/helpers.dart';
import 'show_dialog.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);
  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  int currentPage = 1;
  late int totalpages;
  List<Transaction> transactions = [];
  List<Transaction> transactionWithDate = [];
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  _TransactionsState();

  Future<bool> getTransactionData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalpages + 1) {
        refreshController.loadNoData();
        return true;
      }
    }
    final uid =
        Provider.of<LoginUserProvider>(context, listen: false).user.userLoginId;
    final Uri uri = Uri.parse("http://" +
        returnHost() +
        ":8080/walletengine/get/transactions/$uid/$currentPage");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = TransactionsFromJson(response.body);
      if (isRefresh) {
        transactions = result.transactions;
      } else {
        transactions.addAll(result.transactions);
      }
      String currentDate = "";
      transactionWithDate = [];
      for (int i = 0; i < transactions.length; i++) {
        String temp = DateFormat('dd-MM').format(transactions[i].date);
        if (currentDate == "") {
          Transaction t = Transaction(
              amount: 0,
              date: transactions[i].date,
              name: '',
              transactionNumber: '');
          transactionWithDate.add(t);
          currentDate = DateFormat('dd-MM').format(transactions[i].date);
          transactionWithDate.add(transactions[i]);
        } else if (currentDate != temp) {
          Transaction t = Transaction(
              amount: 0,
              date: transactions[i].date,
              name: '',
              transactionNumber: '');
          transactionWithDate.add(t);
          currentDate = DateFormat('dd-MM').format(transactions[i].date);
          transactionWithDate.add(transactions[i]);
        } else {
          transactionWithDate.add(transactions[i]);
        }
      }
      totalpages = result.totalPages;
      currentPage++;
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userObj = Provider.of<LoginUserProvider>(context, listen: false);
    return SmartRefresher(
      enablePullUp: true,
      controller: refreshController,
      onRefresh: () async {
        await userObj.fetchData(userObj.user.userLoginId);
        transactionWithDate = [];
        final result = await getTransactionData(isRefresh: true);
        if (result) {
          refreshController.refreshCompleted();
        } else {
          refreshController.refreshFailed();
        }
      },
      onLoading: () async {
        final result = await getTransactionData();
        if (result) {
          refreshController.loadComplete();
        } else {
          refreshController.loadFailed();
        }
      },
      child: ListView.builder(
          itemBuilder: ((context, index) {
            final transaction = transactionWithDate[index];
            Color c = Colors.red;
            String amt;
            if (transaction.amount >= 0) {
              amt = '\$ -' + transaction.amount.toString();
              c = Colors.red.withOpacity(0.8);
            } else {
              amt = '\$ ' + (transaction.amount * -1).toString();
              c = Colors.green.withOpacity(0.8);
            }
            String temp = DateFormat('dd-MM').format(transaction.date);
            if (transaction.name == "") {
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        conMonth(temp) + ' ' + temp.substring(0, 2),
                        textAlign: TextAlign.left,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const Expanded(
                        child: DottedLine(
                      dashColor: Colors.white,
                    )),
                    Container(
                      child: Text(
                        "  \$0.00",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  showDialogFunc(context, transaction, c);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 8.0.h, bottom: 8.0.h, left: 20.0.w, right: 20.0.w),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)]
                                [Random().nextInt(9) * 100]
                            ?.withOpacity(Random().nextInt(7) / 10 + (0.2)),
                        radius: 25.r,
                        child: Text(
                          fun1(transaction.name),
                          style:
                              TextStyle(fontSize: 25.sp, color: Colors.white),
                        ), //Text
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: Text(
                          transaction.name,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          amt,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 24.sp,
                                color: c,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
          itemCount: transactionWithDate.length),
    );
  }
}
