import 'package:flutter/material.dart';
import 'package:menu/futures/presentation/views/home_view.dart';
import '../../../home/home_screen.dart';
import '../views/menu_view.dart';
import '../views/pain_page.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({
    super.key,
  });

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int pageIndex = 0;

  List<Widget> screen = [
    const HomeView(),
    const MenuView(),
    const PainPage(),
    const HomeScreen(),
  ];

  routerScreen({required int index}) {
    if (pageIndex != index) {
      setState(() {
        pageIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) {
          routerScreen(index: index);
        },
        backgroundColor: Colors.green,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.blue,
        ),
        selectedItemColor: const Color(0xffF9B803),
        iconSize: 20.0,
        items: const [
          BottomNavigationBarItem(
            label: 'Башкы бет',
            icon: Icon(
              Icons.home,
              size: 25,
              color: Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Жеке баракча',
            icon: Icon(
              Icons.person_pin_circle_rounded,
              color: Colors.blue,
              size: 25,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Жеке баракча',
            icon: Icon(
              Icons.person_pin_circle_rounded,
              color: Colors.blue,
              size: 25,
            ),
          ),
          BottomNavigationBarItem(
            label: 'GoogleMap',
            icon: Icon(
              Icons.map,
              color: Colors.blue,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
