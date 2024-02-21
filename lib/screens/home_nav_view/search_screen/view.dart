import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          textAlign: TextAlign.center,
          "Dafitzone",
          style: TextStyle(
              color: Colors.black,
              fontSize: 28.sp,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: AssetImage(
              "assets/images/img.jpg",
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                width: 350.w,
                height: 55.h,
                child: TextFormField(
                  onTap: () {
                    // navigateTo(context, HomeScreenView());
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "ابحث هنا...",
                    labelStyle: TextStyle(
                        color: Color(0xff9CA3AF),
                        wordSpacing: 0.5,
                        fontSize: 14),
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    prefixIcon: Icon(Icons.search_outlined),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide:
                          BorderSide(color: Color(0xffFF9800), width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: BorderSide(color: Color(0xffFF472B)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide:
                          BorderSide(color: Color(0xffFF472B), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.r),
                      borderSide: BorderSide(color: Color(0xffFF9800)),
                      gapPadding: 5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
