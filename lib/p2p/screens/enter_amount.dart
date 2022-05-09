import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../login/providers/login_user_provider.dart';
import 'confirm_payment.dart';

//Calculator logic
dynamic text = '0';

class EnterAmount extends StatelessWidget {
  const EnterAmount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  //Button Widget
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return TextButton(
      onPressed: () {
        calculation(btntxt);
      },
      child: Text(
        btntxt,
        style: TextStyle(
          fontSize: 35,
          color: txtcolor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Calculator
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Calculator display
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '\$ $text',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 60,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            width: 150,
                            height: 60,
                            child: FloatingActionButton.extended(
                              heroTag: "Hero5",
                              onPressed: () {
                                final balance = Provider.of<LoginUserProvider>(
                                        context,
                                        listen: false)
                                    .balance;
                                int enteredAmount = int.parse(
                                    text.toString().replaceAll(',', ''));
                                if (enteredAmount > balance) {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: const Text("Error"),
                                            content: Text(
                                                "Insufficient Funds , your current balance is \$$balance"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      text = text;
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("OK"))
                                            ],
                                          ));
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ConfirmPayment()),
                                  );
                                }
                              },
                              backgroundColor: Colors.red,
                              extendedTextStyle: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                              label: const Text("Pay"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('C', Colors.white, Colors.black),
                calcbutton('0', Colors.white, Colors.black),
                calcbutton('.', Colors.white, Colors.black),
              ],
            ),
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1', Colors.white, Colors.black),
                calcbutton('2', Colors.white, Colors.black),
                calcbutton('3', Colors.white, Colors.black),
                //              calcbutton('x', Colors.amber, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('4', Colors.white, Colors.black),
                calcbutton('5', Colors.white, Colors.black),
                calcbutton('6', Colors.white, Colors.black),
                //               calcbutton('-', Colors.amber, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('7', Colors.white, Colors.black),
                calcbutton('8', Colors.white, Colors.black),
                calcbutton('9', Colors.white, Colors.black),
                //              calcbutton('+', Colors.amber, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void calculation(btnText) {
    if (btnText == '0' && text == '0') {
      text = '0';
    }
    if (btnText == 'C') {
      text = '0';
    } else if (btnText == '.') {
      if (!text.toString().contains('.')) {
        text = text.toString() + '.';
      }
    } else {
      text = text + btnText;
    }
    setState(() {
      String temp = text.toString();
      String decimalPart = text.toString().contains('.')
          ? temp.substring(temp.indexOf(".") + 1)
          : "";
      text = text.toString().contains('.')
          ? temp.substring(0, temp.indexOf(".") - 1)
          : text;
      text = NumberFormat.decimalPattern('en_us')
          .format(int.parse(text.toString().replaceAll(",", "")))
          .toString();
      text = text + decimalPart;
    });
  }
}
