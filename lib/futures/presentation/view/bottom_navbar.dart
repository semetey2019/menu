import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu/futures/presentation/view/home_view.dart';
import 'package:menu/futures/presentation/view/menu_view.dart';
import 'package:menu/futures/presentation/view/pain.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int screens = 0;
  int pageIndex = 0;

  routerScreen({required int index}) {
    if (pageIndex != index) {
      setState(() {
        pageIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.location_on_outlined),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Санкт-Петербург", style: theme.textTheme.titleLarge),
            Text(
              "12 Августа, 2023",
              style: theme.textTheme.titleMedium?.copyWith(
                color: const Color.fromRGBO(0, 0, 0, 0.5),
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                "assets/5.png",
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
            index: screens,
            children: [HomeView(), MenuView(), PainPage(), Scaffold()]),
      ),
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          currentIndex: screens,
          onTap: _onTabTapped,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.green,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.red),
          selectedItemColor: Colors.blue,
          iconSize: 20.0,
          items: const [
            BottomNavigationBarItem(
              label: 'Главная',
              icon: Icon(
                Icons.home,
                color: Colors.blue,
                size: 25,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Поиск',
              icon: Icon(
                Icons.search,
                color: Colors.blue,
                size: 25,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Корзина',
              icon: Icon(
                CupertinoIcons.cart,
                color: Colors.blue,
                size: 25,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Аккаунт',
              icon: Icon(
                Icons.person,
                color: Colors.blue,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(
      () {
        screens = index;
      },
    );
  }
}

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({Key? key}) : super(key: key);

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int screens = 0;

//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     return Scaffold(
//       // ... (остальная часть вашего кода)

//       bottomNavigationBar: SizedBox(
//         child: BottomNavigationBar(
//           currentIndex: screens,
//           onTap: _onTabTapped, items: [],
//           // ... (остальная часть вашего кода)
//         ),
//       ),
//     );
//   }

//   void _onTabTapped(int index) {
//     setState(() {
//       screens = index; // Исправление: обновляем screens новым индексом
//     });
//   }
// }
