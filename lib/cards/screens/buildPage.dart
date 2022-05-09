// ignore_for_file: file_names
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/buildBalance.dart';
import '../widgets/buildCard.dart';
import '../widgets/card_info.dart';
import '../widgets/top_up.dart';

Widget buildPage(
  CarouselController carouselController,
  BuildContext context,
  dynamic c,
  String cardType,
  int activeIndex,
) =>
    Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(children: [
        //build card
        GestureDetector(
            // onHorizontalDragUpdate: (details) {
            //   // Note: Sensitivity is integer used when you don't want to mess up vertical drag
            //   int sensitivity = 8;
            //   if (details.delta.dx > sensitivity && activeIndex == 0) {
            //     // Right Swipe
            //     carouselController.nextPage();
            //   } else {
            //     // Right Swipe
            //     carouselController.previousPage();
            //   }
            //   if (details.delta.dx < -sensitivity && activeIndex == 1) {
            //     //Left Swipe
            //     carouselController.previousPage();
            //   } else {
            //     //Left Swipe
            //     carouselController.previousPage();
            //   }
            // },
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(35.r),
                        bottom: Radius.circular(35.r)),
                  ),
                  context: context,
                  builder: (context) => bottomSheet(context));
            },
            child: buildCard(cardType, c, context)),
        //build balance
        GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(35.r),
                        bottom: Radius.circular(35.r)),
                  ),
                  context: context,
                  builder: (context) => Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 15.0.h, horizontal: 15.w),
                      child: topUp(context)));
            },
            child: buildBalance(activeIndex, context)),
      ]),
    );
