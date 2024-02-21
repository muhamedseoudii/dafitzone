import 'package:dafitzone/api_model/model.dart';
import 'package:dafitzone/component/containers_design/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsView extends StatelessWidget {
  final DietProgramMealElement meal;
  final num totalCalories;
  final num totalProtein;
  final num totalCarb;
  final num totalFat;
  final num totalFiber;
  final num totalSugar;

  const ProductDetailsView({
    Key? key,
    required this.meal,
    required this.totalCalories,
    required this.totalProtein,
    required this.totalCarb,
    required this.totalFat,
    required this.totalFiber,
    required this.totalSugar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalCaloriesPercentageString =
        ((num.parse(meal.foodElement.calories) / totalCalories) * 100)
            .toStringAsFixed(1);
    final totalProteinPercentageString =
        ((num.parse(meal.foodElement.protein) / totalProtein) * 100)
            .toStringAsFixed(1);
    final totalCarbPercentageString =
        ((num.parse(meal.foodElement.carbohydrates) / totalCarb) * 100)
            .toStringAsFixed(1);
    final totalFatPercentageString =
        ((num.parse(meal.foodElement.fat) / totalFat) * 100).toStringAsFixed(1);
    final totalFiberPercentageString =
        ((num.parse(meal.foodElement.fiber) / totalFiber) * 100)
            .toStringAsFixed(1);
    final totalSugarPercentageString =
        ((num.parse(meal.foodElement.sugar) / totalSugar) * 100)
            .toStringAsFixed(1);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text("تفاصيل ${meal.foodElement.name}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 30, top: 20),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, size: 35)),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                FoodElementContainers(
                    carbText: "${totalCarb.round()}g",
                    caloriestext: "${totalCalories.round()}cal",
                    proteinText: "${totalProtein.round()}g"),
                SizedBox(height: 10.h),
                Container(
                  width: 375.w,
                  height: 35.h,
                  child: ListTile(
                    title: Text("البروتينات",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    trailing: SizedBox(
                      width: 100.w,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${meal.foodElement.protein}g",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              "$totalProteinPercentageString%",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                    ),
                  ),
                ),
                Container(
                  width: 375.w,
                  height: 35.h,
                  child: ListTile(
                    title: Text("سعرات",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    trailing: SizedBox(
                      width: 100.w,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${meal.foodElement.calories}g",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              "$totalCaloriesPercentageString%",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                    ),
                  ),
                ),
                Container(
                  width: 375.w,
                  height: 35.h,
                  child: ListTile(
                    title: Text("الكارب",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    trailing: SizedBox(
                      width: 100.w,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${meal.foodElement.carbohydrates}g",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              "$totalCarbPercentageString%",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                    ),
                  ),
                ),
                Container(
                  width: 375.w,
                  height: 35.h,
                  child: ListTile(
                    title: Text("الدهون",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    trailing: SizedBox(
                      width: 100.w,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(meal.foodElement.fat,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              "$totalFatPercentageString%",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                    ),
                  ),
                ),
                Container(
                  width: 375.w,
                  height: 35.h,
                  child: ListTile(
                    title: Text("ألياف",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    trailing: SizedBox(
                      width: 100.w,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(meal.foodElement.fiber,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              "$totalFiberPercentageString%",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                    ),
                  ),
                ),
                Container(
                  width: 375.w,
                  height: 35.h,
                  child: ListTile(
                    title: Text("السكريات",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    trailing: SizedBox(
                      width: 100.w,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${meal.foodElement.sugar}g",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              "$totalSugarPercentageString%",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Divider(
                  color: Colors.black,
                  indent: 10.sp,
                  endIndent: 23.sp,
                ),
                SizedBox(height: 15.h),
                Text(
                  "${meal.quantity} قطعة",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.h),
                Text(
                  meal.foodElement.description,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
