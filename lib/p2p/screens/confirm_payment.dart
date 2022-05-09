import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:provider/provider.dart';
import 'package:rpay/cards/screens/home_page.dart';
import 'package:rpay/p2p/screens/transaction_complete.dart';
import '../../login/providers/login_user_provider.dart';
import '../providers/search_user_list_provider.dart';
import 'enter_amount.dart';

var jsonres;

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/RakutenPay.jpg",
          fit: BoxFit.cover,
          height: 30,
        ),
      ),
      body: Builder(builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(left: 50)),
              const Text(
                "Pay \$",
                style: TextStyle(fontSize: 50),
              ),
              Text(
                text.toString(),
                style: const TextStyle(fontSize: 50),
              ),
              Text(
                " to " + receiverName.toString() + " ?",
                style: const TextStyle(fontSize: 50),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.extended(
                    heroTag: "Hero4",
                    onPressed: () async {
                      final result = await Connectivity().checkConnectivity();
                      if (result == ConnectivityResult.none) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text(
                                "You are not connected to internet. Please check your connection"),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {},
                            )));
                      } else {
                        jsonres = await Provider.of<LoginUserProvider>(context,
                                listen: false)
                            .transfer(receiverUid, text);
                        jsonres = json.decode(jsonres.toString());
                        Navigator.of(context).popUntil((route) => false);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage()),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const TransactionComplete()),
                        );
                        text = '0';
                      }
                      // else {
                      //   await sendPostRequest();
                      //   jsonres = json.decode(jsonres);
                      //   text = '0';
                      //   final user = Provider.of<LoginUserProvider>(context,
                      //       listen: false);
                      //   await Provider.of<LoginUserProvider>(context,
                      //           listen: false)
                      //       .updateBalance(user.user.userLoginId);
                      //   route.isFirst,
                      //   // Navigator.pushAndRemoveUntil(
                      //   //     context,
                      //   //     MaterialPageRoute(
                      //   //         builder: (context) =>
                      //   //             const TransactionComplete()),
                      //   //     (route) => route.isFirst);
                      // }
                    },
                    backgroundColor: Colors.red,
                    extendedTextStyle: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    label: const Text("Pay"),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
