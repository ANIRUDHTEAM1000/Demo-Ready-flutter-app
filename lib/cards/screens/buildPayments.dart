// ignore_for_file: file_names

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/transasctions.dart';

Widget buildPayments(
    activeIndex, CarouselController controller1) {
  if (activeIndex == 0) {
    return Expanded(
        child: GestureDetector(
      onHorizontalDragUpdate: (details) {
        // Note: Sensitivity is integer used when you don't want to mess up vertical drag
        int sensitivity = 8;
        if (details.delta.dx > sensitivity) {
          // Right Swipe
          controller1.nextPage();
        } else if (details.delta.dx < -sensitivity) {
          //Left Swipe
          controller1.nextPage();
        }
      },
      child: Container(
          margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 40.h),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8.0.h),
                width: double.infinity,
                child: Text(
                  "Payment history",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Expanded(child: Container(child: const Transactions())),
            ],
          )),
    ));
  } else {
    return Expanded(
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          // Note: Sensitivity is integer used when you don't want to mess up vertical drag
          int sensitivity = 8;
          if (details.delta.dx > sensitivity) {
            // Right Swipe
            controller1.previousPage();
          } else if (details.delta.dx < -sensitivity) {
            //Left Swipe
            controller1.previousPage();
            print('left');
          }
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.0.w),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Text("Installment Activity",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      )),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: Text("Active",
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
                Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: const Text(
                        "Ended",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const Expanded(
                        child: DottedLine(
                      dashColor: Colors.white,
                    )),
                    Container(
                      child: const Text(
                        "  \$0.00",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Row(
                    children: <Widget>[
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// if (activeIndex == 0) {
//               controller1.nextPage();
//             } else {
//               controller1.previousPage();
//             }