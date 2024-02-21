import 'package:flutter/material.dart';

import 'cart_screen/view.dart';
import 'home_bar/view.dart';
import 'home_screen/view.dart';
import 'profile_screen/view.dart';
import 'search_screen/view.dart';


class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({super.key, required this.title});

  static List<Widget> pages = const [
    HomeScreenView(),
    ProfilePageView(),
    SearchPageView(),
    CartPageView()
  ];
  int currentPage = 0;
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: PageView.builder(
            itemCount: pages.length,
            controller: controller,
            itemBuilder: (context, index) => pages[index],
          ),
          // pages[currentPage],
        ),
        bottomNavigationBar: HomeBarView(
          controller: controller,
        ));
  }
}
