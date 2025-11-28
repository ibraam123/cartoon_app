import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_bottom_navbar.dart';
import '../../../dashboard/presentation/views/dashboard_parent_view.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../../../rewards/presentation/views/rewards_view.dart';
import 'home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    RewardsView(),
    DashboardParentView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
