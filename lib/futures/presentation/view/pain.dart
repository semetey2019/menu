import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PainPage extends StatefulWidget {
  const PainPage({super.key});

  @override
  State<PainPage> createState() => _PainPageState();
}

class _PainPageState extends State<PainPage> {
  int index = 1;
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
        padding:
            const EdgeInsets.only(left: 16, top: 20, right: 16, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  width: 62,
                  height: 62,
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Image.asset(
                      "assets/2.png",
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Зеленый салат",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "390 ₽ · ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            " 420г",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  height: 32,
                  width: 99,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (index > 1) index--;
                          });
                        },
                        child: const Icon(Icons.remove),
                      ),
                      Text(
                        "$index",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            index++;
                          });
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  minimumSize: const Size.fromHeight(48)),
              onPressed: () {},
              child: const Text(
                "Оплатить 2 004 ₽",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
