// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../providers/search_user_list_provider.dart';
import 'confirm_payment.dart';

class TransactionComplete extends StatelessWidget {
  const TransactionComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        actions: [
          TextButton(
              child: const Text("Back"),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/RakutenPay.jpg",
          fit: BoxFit.cover,
          height: 30,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 40),
        child: Center(
          child: Column(
            children: <Widget>[
              const Text(
                "Transaction Complete",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.only(top: 40),
                child: const Text(
                  "Transaction Number",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Center(
                  child: Text(
                    "${jsonres["transaction_number"]}",
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(DateTime.now().toString().substring(0, 19),
                    style: const TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Text(
                  "\$${jsonres["amount"]} USD",
                  style: const TextStyle(
                      fontSize: 40,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text("is paid from your Rpay",
                    style: TextStyle(fontSize: 16)),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  "balance to",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  receiverName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
