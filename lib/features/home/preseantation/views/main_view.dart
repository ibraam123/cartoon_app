import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_bottom_navbar.dart';
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
    FavoriteView(),
    CartView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _currentIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search View'),
    );
  }
}
class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search View'),
    );
  }
}

