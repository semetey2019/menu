import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PainPage extends StatefulWidget {
  const PainPage({super.key});

  @override
  State<PainPage> createState() => _PainPageState();
}

class _PainPageState extends State<PainPage> {
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
            Text("Санкт-Петербург", style: theme.textTheme.titleMedium),
            Text(
              "12 Августа, 2023",
              style: theme.textTheme.titleSmall?.copyWith(
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
      body: Padding(
        padding: EdgeInsets.only(left: 16, top: 20, right: 16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 72,
                  height: 72,
                  child: Image.asset(
                    "assets/2.png",
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
