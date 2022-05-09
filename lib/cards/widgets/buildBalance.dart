import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rpay/login/providers/login_user_provider.dart';

Widget buildBalance(int activeIndex, BuildContext context) {
  if (activeIndex == 0) {
    return Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Consumer<LoginUserProvider>(
          builder: (context, data, child) => Column(
            children: [
              Text(
                "Prepaid Balance",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$ "+data.balance.toString(),
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Text(
                    ".00",
                    textAlign: TextAlign.end,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 3.h, bottom: 3.h, left: 18.w, right: 18.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5.w,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  "TOP UP",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
        ));
  } else {
    return Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Shopping Power",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    " \$1000.00",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Pay monthly",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: Text(
                    " \$60.00",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 3.h, bottom: 3.h, left: 18.w, right: 18.w),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1.5.w,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "DETAIL",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ));
  }
}
