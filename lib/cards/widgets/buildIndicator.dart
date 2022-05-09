// widget
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildIndicator(int activeIndex) => Container(
      margin: EdgeInsets.only(top: 8.h, bottom: 10.h),
      child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 2,
        effect: JumpingDotEffect(
            dotHeight: 8.0.h,
            dotWidth: 8.0.w,
            activeDotColor: Colors.white,
            dotColor: Colors.grey),
      ),
    );
