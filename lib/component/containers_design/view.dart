import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodElementContainers extends StatelessWidget {
  final String carbText, caloriestext, proteinText;

  FoodElementContainers(
      {Key? key,
      required this.carbText,
      required this.caloriestext,
      required this.proteinText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320.w,
        height: 80.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.fromBorderSide(BorderSide(color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  carbText,
                  style: TextStyle(color: Color(0xffFF9800), fontSize: 16),
                ),
                SizedBox(height: 5.h),
                Text(
                  "الكارب",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
            VerticalDivider(
              color: Colors.grey,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  caloriestext,
                  style: TextStyle(color: Color(0xffFF9800), fontSize: 16),
                ),
                SizedBox(height: 5.h),
                Text(
                  "سعرات",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
            VerticalDivider(
              color: Colors.grey,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  proteinText,
                  style: TextStyle(color: Color(0xffFF9800), fontSize: 16),
                ),
                SizedBox(height: 5.h),
                Text(
                  "البروتينات",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
