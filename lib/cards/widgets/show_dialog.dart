import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showDialogFunc(context, transaction, c) {
  String tdate = DateFormat('MMMM  dd  yyyy').format(transaction.date);
  final _utcTime = DateTime.utc(0, 0, 0, transaction.date.hour,
      transaction.date.minute, transaction.date.second);
  final _localTime = _utcTime.toLocal();
  String tTime = DateFormat('hh:mm aaa').format(_localTime);

  String amt;
  String debitOrCredit;
  if (transaction.amount < 0) {
    amt = "\$" + (transaction.amount * -1).toString();
    debitOrCredit = "Received From : ";
  } else {
    amt = "\$" + (transaction.amount).toString();
    debitOrCredit = "Paid To : ";
  }
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tdate,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.blue, fontSize: 18.sp),
                      ),
                      SizedBox(
                        width: 5.0.w,
                      ),
                      const Expanded(
                          child: DottedLine(
                        dashColor: Colors.blue,
                      )),
                      SizedBox(
                        width: 5.0.w,
                      ),
                      Text(
                        tTime,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.blue, fontSize: 16.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5.r),
                      child: Icon(
                        Icons.account_circle_rounded,
                        size: 100.0.sp,
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Transaction details here ",
                    style: TextStyle(fontSize: 15.sp, color: Colors.black),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 10.0.h, horizontal: 10.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          debitOrCredit,
                          style:
                              TextStyle(color: Colors.black, fontSize: 20.0.sp),
                        ),
                        Text(
                          transaction.name,
                          style:
                              TextStyle(color: Colors.black, fontSize: 20.0.sp),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 10.0.h, horizontal: 10.0.w),
                    child: Text(
                      "Transaction Number:",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black, fontSize: 14.0.sp),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 10.0.h, horizontal: 10.0.w),
                    child: Text(
                      transaction.transactionNumber,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black, fontSize: 10.0.sp),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 10.0.w, vertical: 10.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Amount : ",
                          style:
                              TextStyle(color: Colors.black, fontSize: 20.0.sp),
                        ),
                        Text(
                          amt,
                          style: TextStyle(color: c, fontSize: 20.0.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
