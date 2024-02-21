import 'package:dafitzone/api_model/model.dart';
import 'package:dafitzone/component/containers_design/view.dart';
import 'package:dafitzone/component/tabbar_design/view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  bool isLoading = true;
  bool isFailed = false;

  Future<ResponseData?> getDetails() async {
    try {
      var response = await Dio().get(
        "https://app.dafitzone.com/api/v1/trainne/diet-programs?id=78",
      );
      return DaFitZoneModel.fromJson(response.data).data.data[0];
    } on DioException {
      isLoading = false;
      throw Exception("Error fetching data");
    }
  }

  late final Future<ResponseData?> futureValue;

  @override
  void initState() {
    futureValue = getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Icon(Icons.arrow_forward, size: 35),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [
              FutureBuilder(
                future: futureValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.orange,
                    ));
                  }
                  if (snapshot.hasError) {
                    final error = snapshot.error;
                    return Center(child: Text(error.toString()));
                  }
                  final data = snapshot.data;
                  if (data == null) {
                    return Center(child: Text("No data"));
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (data.dietProgramMeal.isEmpty)
                        Center(child: const Text("No Data")),
                      if (data.dietProgramMeal.isNotEmpty)
                        ...data.dietProgramMeal.map((e) {
                          return Column(
                            children: [
                              Text(
                                "متوسط نسب الوجبات فى اليوم",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 12.h),
                              ...e.dietProgramMealElement.map((meal) => Column(
                                    children: [
                                      FoodElementContainers(
                                          carbText:
                                              "${meal.foodElement.carbohydrates}g",
                                          caloriestext:
                                              "${meal.foodElement.calories}cal",
                                          proteinText:
                                              "${meal.foodElement.protein}g"),
                                      TabBarDesign(text: "")
                                    ],
                                  )),
                            ],
                          );
                        })
                    ],
                  );
                },
              )
            ],
          ),
        ));
  }
}
