import 'package:dafitzone/component/button_design/view.dart';
import 'package:dafitzone/component/list_design/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          textAlign: TextAlign.start,
          "حسابـــى",
          style: TextStyle(
              color: Colors.black,
              fontSize: 28.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                CustomizeList(
                  image: "assets/images/img.jpg",
                  text: "محمد سعودى",
                  text1: "muhammedsoudii@gmail.com",
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "حسابـــى",
                    style: TextStyle(fontSize: 20.sp, color: Colors.black),
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Container(
                    width: 361.w,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.white,
                        border: Border.fromBorderSide(
                            BorderSide(color: Color(0xffFF9800)))),
                    child: Column(
                      children: [
                        CustomizeList1(
                          text: "العناصر المحفوظة",
                          color: 0xffD50000,
                          icon: "heart",
                        ),
                        Divider(
                          color: Color(0xffFF9800),
                          thickness: 1.sp,
                          indent: 50,
                        ),
                        CustomizeList1(
                          text: "طلباتي",
                          color: 0xffC6FF00,
                          icon: "order",
                        ),
                        Divider(
                          color: Color(0xffFF9800),
                          thickness: 1.sp,
                          indent: 50,
                        ),
                        CustomizeList1(
                          text: "الوجبات",
                          color: 0xffFF6F00,
                          icon: "brand",
                        ),
                        Divider(
                          color: Color(0xffFF9800),
                          thickness: 1.sp,
                          indent: 50,
                        ),
                        CustomizeList1(
                          text: "عناوين الوجبات",
                          color: 0xffE91E63,
                          icon: "location",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "تواصل معنا",
                    style: TextStyle(fontSize: 18.sp, color: Colors.black),
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Container(
                    width: 361.w,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.white,
                        border: Border.fromBorderSide(
                            BorderSide(color: Color(0xffFF9800)))),
                    child: Column(
                      children: [
                        CustomizeList1(
                          text: "الأحكام والشروط",
                          color: 0xff2196F3,
                          icon: "terms",
                        ),
                        Divider(
                          color: Color(0xffFF9800),
                          thickness: 1.sp,
                          indent: 50,
                        ),
                        CustomizeList1(
                          text: "اتصل بنا",
                          color: 0xffC6FF00,
                          icon: "call",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                CustomizeButton1(
                  OnClick: () {},
                  text: " Sign out",
                  color: Color(0xff424242),
                  size: 16,
                  color1: Color(0xff424242),
                  icon: "logout",
                ),
                SizedBox(height: 20.h),
                CustomizeButton1(
                  OnClick: () {},
                  text: " Delete Account",
                  color: Color(0xffD50000),
                  size: 16,
                  color1: Color(0xffD50000),
                  icon: "trash",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
