import 'package:flutter/material.dart';
import 'package:gender_equality/pages/compare_page.dart';
import 'package:gender_equality/pages/home_page.dart';
import 'package:gender_equality/pages/search_page.dart';
import 'package:gender_equality/assets/colors.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedPage = 0;

  final List<Widget> _pages = <Widget>[
    const HomePage(),
    const SearchPage(),
    const ComparePage(),
  ];

  void _onPageTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mediumGray,
        title: const Text('Gender-Equality App',
            style: TextStyle(color: Colors.black)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: _pages[_selectedPage],
      bottomNavigationBar: navBar(),
    );
  }

  BottomNavigationBar navBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows_outlined),
            activeIcon: Icon(Icons.compare_arrows_sharp),
            label: 'Compare'),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      onTap: _onPageTapped,
      currentIndex: _selectedPage,
      backgroundColor: AppColors.mediumGray,
      showUnselectedLabels: false,
    );
  }
}
