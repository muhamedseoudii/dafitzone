import 'package:dafitzone/api_model/model.dart';
import 'package:dafitzone/screens/home_nav_view/home_screen/product_details/view.dart';
import 'package:dafitzone/utils/helper_methods.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabBarDesign extends StatefulWidget {
  final String text;

  TabBarDesign({Key? key, required this.text}) : super(key: key);

  @override
  State<TabBarDesign> createState() => _TabBarDesignState();
}

class _TabBarDesignState extends State<TabBarDesign>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    futureValue = getDetails();
  }

  late final Future<ResponseData?> futureValue;

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Future<ResponseData?> getDetails() async {
    try {
      var response = await Dio().get(
        "https://app.dafitzone.com/api/v1/trainne/diet-programs?id=78",
      );
      return DaFitZoneModel.fromJson(response.data).data.data[0];
    } on DioException {
      throw Exception("Error fetching data");
    }
  }

  num totalCarbs = 0;
  num totalProtein = 0;
  num totalCalories = 0;
  num totalFat = 0;
  num totalFiber = 0;
  num totalSugar = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: TabBar(
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Color(0xffFF9800),
              unselectedLabelColor: Colors.black,
              labelColor: Color(0xffFF9800),
              tabs: const [
                Tab(text: "النظام الحالي"),
                Tab(text: "الأنظمة السابقة")
              ]),
        ),
        SizedBox(
          height: 550.h,
          child: TabBarView(
            controller: tabController,
            children: [
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.orange,
                    ));
                  }
                  if (snapshot.hasError) {
                    final error = snapshot.error;
                    return Center(
                      child: Text(
                        error.toString(),
                      ),
                    );
                  }
                  final data = snapshot.data;
                  if (data == null) {
                    return const Center(
                      child: Text("No Data"),
                    );
                  }
                  return SizedBox(
                      height: 450,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (data.dietProgramMeal.isEmpty)
                                  const Center(
                                    child: Text("No Data"),
                                  ),
                                if (data.dietProgramMeal.isNotEmpty)
                                  ...data.dietProgramMeal.map((e) {
                                    for (var element
                                        in e.dietProgramMealElement) {
                                      totalCarbs += num.parse(
                                          element.foodElement.carbohydrates);
                                      totalProtein += num.parse(
                                          element.foodElement.protein);
                                      totalCalories += num.parse(
                                          element.foodElement.calories);
                                      totalFat +=
                                          num.parse(element.foodElement.fat);
                                      totalFiber +=
                                          num.parse(element.foodElement.fiber);
                                      totalSugar +=
                                          num.parse(element.foodElement.sugar);
                                    }
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10),
                                        Text(e.mealName,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(height: 10),
                                        ...e.dietProgramMealElement
                                            .map((meal) => InkWell(
                                                  onTap: () {
                                                    navigateTo(
                                                        context,
                                                        ProductDetailsView(
                                                          totalCalories:
                                                              totalCalories,
                                                          totalCarb: totalCarbs,
                                                          totalProtein:
                                                              totalProtein,
                                                          meal: meal,
                                                          totalFat: totalFat,
                                                          totalFiber:
                                                              totalFiber,
                                                          totalSugar:
                                                              totalSugar,
                                                        ));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 10),
                                                    child: Container(
                                                      width: 340.w,
                                                      height: 60.h,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.r),
                                                          border: Border
                                                              .fromBorderSide(
                                                                  BorderSide(
                                                                      color: Color(
                                                                          0xffFF9800)))),
                                                      child: ListTile(
                                                        leading:
                                                            Icon(Icons.close),
                                                        title: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  icon:
                                                                      SvgPicture
                                                                          .asset(
                                                                    "assets/icons/apple.svg",
                                                                    height: 30,
                                                                    width: 30,
                                                                  )),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                  meal.foodElement
                                                                      .name,
                                                                  // model!.data.data[1].total

                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              Text(
                                                                "قطعه x${meal.quantity}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                              )
                                                            ]),
                                                        trailing: Icon(Icons
                                                            .arrow_forward_ios),
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                      ],
                                    );
                                  }),
                              ],
                            ),
                          )
                        ],
                      ));
                },
                future: futureValue,
              ),
              Icon(Icons.directions_transit, size: 350),
            ],
          ),
        )
      ],
    );
  }
}
