import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  final List<dynamic> categories;

  const MyTabBar({
    super.key,
    required this.tabController,
    required this.categories,
    });

  List<Tab> _buildCategoryTabs() {
    return categories.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: _buildCategoryTabs(),
    );
  }
}