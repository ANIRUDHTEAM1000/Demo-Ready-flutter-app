import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_screen.dart';



class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _Splash createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>  const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding:
                     EdgeInsets.only(left: 120.w, right: 120.w, bottom: 30.h),
                color: const Color.fromARGB(0, 216, 36, 36),
                child: Image.asset(
                  "assets/images/RakutenPay.jpg",
                  fit: BoxFit.contain,
                ),
              ),
               Text("Let's  get  started",
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
            ]),
      ),
    );
  }
}


