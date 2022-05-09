import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Container buildCard(String cardType, dynamic c, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(11.r),
      color: c,
    ),
    width: 295.w,
    height: 170.h,
    child: Column(
      children: [
        // rakuten image on card and type of card
        Expanded(
          child: Row(children: [
            Container(
              height: 40.h,
              width: 90.w,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Center(
                child: Image.asset(
                  "assets/images/whitebgRakuten-removebg-preview.ico",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.0.w),
                child: Text(
                  cardType,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Bitter',
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ]),
        ),
        //Tap to reveal
        Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "TAP TO REVEAL",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ]),
        ),
        // circle
        Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 16.0.h, bottom: 16.0.h, left: 16.0.w, right: 16.0.w),
              child: Text(
                "circle",
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
        ),
      ],
    ),
  );
}
