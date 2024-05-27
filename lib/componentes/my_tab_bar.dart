import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({
    super.key,
    required this.tabController,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: const [
          //Primeira aba
          Tab(icon: Icon(Icons.home_outlined),
          ),

          //Segunda aba
          Tab(icon: Icon(Icons.settings_outlined),
          ),

          //Terceira aba
          Tab(icon: Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}