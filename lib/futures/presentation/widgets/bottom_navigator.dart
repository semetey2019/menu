import 'package:flutter/material.dart';
import 'package:menu/futures/presentation/view/home_view.dart';

import '../view/accaunt_page.dart';
import '../view/menu_view.dart';
import '../view/pain.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({
    super.key,
  });

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int pageIndex = 1;

  List<Widget> screen = [
    const HomeView(),
    const MenuView(),
    const PainPage(),
    const AccauntPage(),
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
      body: SizedBox(
        child: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (index) {
            routerScreen(index: index);
          },
          backgroundColor: Colors.green,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          selectedItemColor: const Color(0xffF9B803),
          iconSize: 20.0,
          items: const [
            BottomNavigationBarItem(
              label: 'Башкы бет',
              icon: Icon(
                Icons.home,
                size: 25,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Жеке баракча',
              icon: Icon(
                Icons.person_pin_circle_rounded,
                color: Colors.white,
                size: 25,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Настройка',
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
