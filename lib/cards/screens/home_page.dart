import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
import 'package:rpay/cards/widgets/app_bar.dart';
import 'package:rpay/cards/widgets/buildIndicator.dart';
import 'package:rpay/cards/widgets/nav_bar.dart';
// import '../../login/providers/login_user_provider.dart';
import 'buildPage.dart';
import 'buildPayments.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final carouselController = CarouselController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final topMargin = appbar(context).preferredSize.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const Navbar(),
      appBar: appbar(context),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/images/image.jpeg"),
              alignment: (activeIndex == 0)
                  ? const Alignment(-0.6, 1)
                  : const Alignment(-0.5, 1),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: topMargin * 1.9.h),
          child: Column(
            children: [
              // Carousel
              CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: 2,
                  itemBuilder: (context, index, realIndex) {
                    if (index == 0) {
                      return buildPage(carouselController, context,
                          Colors.blue.withOpacity(0.3), "Prepaid", activeIndex);
                    } else {
                      return buildPage(
                          carouselController,
                          context,
                          Colors.pink.withOpacity(0.3),
                          "Pay Later",
                          activeIndex);
                    }
                  },
                  options: CarouselOptions(
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      // viewportFraction: 1,
                      height: 300.h,
                      onPageChanged: ((index, reason) => {
                            setState(() => {activeIndex = index}),
                          }))),

              // scrolling points
              buildIndicator(activeIndex),
              // transactions
              buildPayments(activeIndex, carouselController)
            ],
          ),
        ),
      ]),
    );
  }
}
