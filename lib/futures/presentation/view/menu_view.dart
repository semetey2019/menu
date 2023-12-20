import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  int pageIndex = 0;

  routerScreen({required int index}) {
    if (pageIndex != index) {
      setState(() {
        pageIndex = index;
      });
    }
  }

  List<String> images = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/7.png',
    'assets/6.png',
    'assets/6.png',
    'assets/6.png',
    'assets/6.png',
    // Добавьте пути к своим изображениям
  ];

  List<String> texts = [
    'Салат по восточному',
    'Рыба с овощами и рисом',
    'Тортеллини',
    'Зеленый салат',
    'Рулеты из ветчины',
    'Рис с овощами',
    'Салат по восточному', 'Салат по восточному',
    'Рыба с овощами и рисом',
    'Тортеллини',
    'Зеленый салат',
    // Добавьте свои описания
  ];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return DefaultTabController(
        initialIndex: 1,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.arrow_back_ios),
            title: const Text('Азиатская кухня'),
            centerTitle: true,
            bottom: TabBar(
              overlayColor: MaterialStateProperty.resolveWith((states) => null),
              dividerColor: Colors.transparent,
              splashBorderRadius: const BorderRadius.all(Radius.circular(10)),
              indicatorColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              labelColor: Colors.black,
              tabs: const [
                Tab(text: 'Все меню'),
                Tab(text: 'Салаты'),
                Tab(text: 'С рисом'),
                Tab(text: 'С рыбой'),
              ],
              indicator: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                border: Border(
                  top: BorderSide(color: Colors.blue, width: 2.0),
                  bottom: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
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
          body: GridView.builder(
            padding: const EdgeInsets.all(16.00),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 10),
            itemCount: texts.length,
            itemBuilder: (BuildContext context, int index) {
              String pngPath = images[index];
              return InkWell(
                onTap: () {
                  setState(() {
                    _dialogBuilder(context);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(pngPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            // Padding(
            //   padding: const EdgeInsets.only(left: 16, right: 16),
            //   child: GridView.count(
            //     crossAxisCount: 3,
            //     shrinkWrap: true,
            //     physics: ScrollPhysics(),
            //     children: [
            //       Column(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             InkWell(
            //               onTap: () {
            //
            //               },
            //               child: Card(
            //                 child: Image.asset('assets/6.png'),
            //               ),
            //             ),
            //             Text(
            //               "Салат по восточному",
            //               style: TextStyle(fontSize: 10),
            //             ),
            //           ]),
            //     ],
            //   ),
          ),
          bottomNavigationBar: SizedBox(
            child: BottomNavigationBar(
              currentIndex: pageIndex,
              onTap: (index) {
                routerScreen(index: index);
              },
              backgroundColor: Colors.green,
              selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.red),
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
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
        ));
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(child: Text('${widget.outerTab}: Overview tab')),
              ),
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(
                    child: Text('${widget.outerTab}: Specifications tab')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        icon: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Image.asset("assets/1.png",
                  height: 230, width: 230, fit: BoxFit.contain),
              SizedBox(
                child: Image.asset(
                  "assets/favorite.png",
                ),
              ),
              SizedBox(
                child: Image.asset(
                  "assets/Icons.png",
                ),
              )
            ],
          ),
        ),
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Рыба с овощами и рисом',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "799 p",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "560г",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ],
            )
          ],
        ),
        content: const Text(
          'Рыба маринованная со специями, лимонным соком, соевым соусом и запечeнная в духовке с лучком, томатами и картошечкой под золотистой майонезно-сырной шубкой',
          textAlign: TextAlign.start,
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'Добавить в корзину',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}