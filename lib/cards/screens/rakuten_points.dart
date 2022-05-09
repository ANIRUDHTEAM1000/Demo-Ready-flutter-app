import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_line/dotted_line.dart';

Widget rakutenPoints(String text) {
  return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(),
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/images/image.jpeg"),
              alignment: const Alignment(-0.6, 1),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 129.h,
          ),
          width: double.infinity,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 150.h),
          width: double.infinity,
          child: Text(
            "\$87.35",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.only(top: 198.h),
            padding:
                EdgeInsets.only(top: 3.h, bottom: 3.h, left: 18.w, right: 18.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 1.5.w,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "REDEEM",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ]),
        Container(
          margin: EdgeInsets.only(top: 230.h),
          width: double.infinity,
          child: Text(
            "You have early access to \$6.68 earned today.",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Container(
          height: 115.h,
          margin: EdgeInsets.only(left: 14.w, right: 14.w, top: 285.h),
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1.5.w,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "HIDDEN PROXIMITY BONUS",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "5 MI AWAY",
                      textAlign: TextAlign.right,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.blue,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 6.h,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "JCPenney gives 16.0% cash back",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "You've found this! Shop at JCPenney San Bruno by 9pm today to grab the hidden rewards.",
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 435.h),
          child: Container(
              margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 40.h),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8.0.h),
                    width: double.infinity,
                    child: Text(
                      "Cash back history",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                child: Text("July 2",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    )),
                              ),
                              const Expanded(
                                  child: DottedLine(
                                dashColor: Colors.white,
                              )),
                              Container(
                                child: Text("  \$0.00",
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 17.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 25,
                                    child: Text(
                                      "R",
                                      style: TextStyle(fontSize: 20.sp),
                                    )),
                                // CircleAvatar(
                                //     backgroundColor: Colors.transparent,
                                //     radius: 25,
                                //     child: Image.asset('assets/images/applelogo.jpg')),
                                Expanded(
                                  child: Text("Apple Store",
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      )),
                                ),
                                Expanded(
                                  child: Text(" Monthly \$30.00",
                                      textAlign: TextAlign.right,
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 25,
                                    child: Text(
                                      "R",
                                      style: TextStyle(fontSize: 20.sp),
                                    )),
                                Expanded(
                                  child: Text("Bose Store",
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                    " Monthly \$30.00",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ]));
}
