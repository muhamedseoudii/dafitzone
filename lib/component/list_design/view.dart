import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomizeList extends StatelessWidget {
  final String text, image, text1;

  CustomizeList(
      {Key? key, required this.text, required this.image, required this.text1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 361.w,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
          border: Border.fromBorderSide(BorderSide(color: Color(0xffFF9800)))),
      child: ListTile(
        style: ListTileStyle.list,
        leading: Image.asset(image, fit: BoxFit.scaleDown),
        title:
            Text(text, style: TextStyle(color: Colors.black, fontSize: 15.sp)),
        subtitle:
            Text(text1, style: TextStyle(color: Colors.black, fontSize: 12.sp)),
        trailing: const Icon(Icons.arrow_forward_ios_outlined,
            color: Color(0xff424242)),
      ),
    ));
  }
}

class CustomizeList1 extends StatelessWidget {
  final String text, icon;
  int color;

  CustomizeList1(
      {Key? key, required this.text, required this.icon, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 370.w,
            height: 60.h,
            color: Colors.white,
            child: ListTile(
              leading: SvgPicture.asset(
                "assets/icons/${icon}.svg",
                fit: BoxFit.scaleDown,
                color: Color(color),
              ),
              title: Text(
                text,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  wordSpacing: 1,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_outlined,
                  color: Color(0xff424242)),
            ),
          )
        ],
      ),
    );
  }
}
