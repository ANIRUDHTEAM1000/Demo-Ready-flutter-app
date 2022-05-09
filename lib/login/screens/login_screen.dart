// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:provider/provider.dart';
import 'package:rpay/cards/screens/home_page.dart';
import 'package:rpay/login/providers/login_user_provider.dart';
import '../widgets/snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// ignore: must_be_immutable
class _LoginScreenState extends State<LoginScreen> {
  String userId = '';
  String password = '';
  Color uidColor = Colors.black;
  Color passwordColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Builder(builder: (context) {
          return Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 25.0.h),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 80.0.w, vertical: 80.0.h),
                  child: Container(
                    alignment: Alignment.center,
                    width: 200.w,
                    height: 75.h,
                    child: Image.asset(
                      "assets/images/RakutenPay.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h, left: 30.w, right: 30.w),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'User ID',
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(
                        fontSize: 25.0.sp,
                        color: uidColor,
                      ),
                      hintStyle:
                          TextStyle(color: Colors.black, fontSize: 30.0.sp),
                    ),
                    onChanged: (value) {
                      setState(() {
                        uidColor = Colors.black;
                      });
                      userId = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0.h, left: 30.w, right: 30.w),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      iconColor: Colors.green,
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(
                        fontSize: 25.0.sp,
                        color: passwordColor,
                      ),
                      hintStyle:
                          TextStyle(color: Colors.white, fontSize: 30.0.sp),
                    ),
                    onChanged: (value) {
                      setState(() {
                        passwordColor = Colors.black;
                      });
                      password = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35.0.h),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: 150.w,
                    height: 50.h,
                    child: FloatingActionButton.extended(
                      elevation: 1,
                      heroTag: "Hero6",
                      foregroundColor: Colors.white,
                      label: const Text("Login"), //remove the variable
                      icon: const Icon(Icons.login),
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      onPressed: () async {
                        final result = await Connectivity().checkConnectivity();
                        if (result == ConnectivityResult.none) {
                          snackBar(context,
                              'You are not connected to internet. Please check your connection');
                        } else {
                          if (userId != '' && password != '') {
                            await Provider.of<LoginUserProvider>(context,
                                    listen: false)
                                .fetchData(userId);
                            if (Provider.of<LoginUserProvider>(context,
                                        listen: false)
                                    .user
                                    .status ==
                                1) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyHomePage()));
                            } else {
                              setState(() {
                                uidColor = Colors.red;
                                passwordColor = Colors.red;
                              });
                              snackBar(context, 'Entered wrong Credentials');
                            }
                          } else {
                            snackBar(context, 'Enter necessary Credentials');
                          }
                          if (userId == '') {
                            setState(() {
                              uidColor = Colors.red;
                            });
                          }
                          if (password == '') {
                            setState(() {
                              passwordColor = Colors.red;
                            });
                          }
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ));
        }),
      ),
    );
  }
}
