import 'package:flutter/material.dart';

import 'package:menu/futures/presentation/views/menu_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/579.png",
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              const SizedBox(height: 8),
              Image.asset(
                "assets/580.png",
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              const SizedBox(height: 8),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuView()));
                  },
                  child: Image.asset(
                    "assets/581.png",
                    fit: BoxFit.fill,
                    width: double.infinity,
                  )),
              const SizedBox(height: 8),
              Image.asset(
                "assets/582.png",
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
