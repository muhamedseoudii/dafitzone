import 'package:dafitzone/utils/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          textAlign: TextAlign.start,
          "عربتـــــي",
          style: TextStyle(
              color: Colors.black,
              fontSize: 28.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 180),
          child: Column(
            children: [
              Image.asset("assets/images/cart.png",
                  fit: BoxFit.scaleDown,
                  width: 170.w,
                  height: 200.h,
                  color: Color(0xffFF9800)),
              SizedBox(height: 70.h),
              Text(
                "عربــة التســـوق فارغـــة!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 30.h),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color(0xffffffff),
                  side: BorderSide(color: Color(0xffFF9800)),
                ),
                onPressed: () {
                  navigateTo(
                    context,
                    MyHomePage(title: "Home"),
                  );
                },
                child: Text(
                  "لنذهب للوجبات",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
