import 'package:flutter/material.dart';
import 'package:login/screens/home/widget/detail_card.dart';
import 'package:login/screens/home/widget/tab_card.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required specialItem});
  final List<Color> colors = [
    Colors.black,
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              color: Colors.white,
              child: const Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  DetailCard()
                ],
              ),
            ),
            Positioned(
              // bottom: MediaQuery.of(context).size.height * 0.2,
              top: MediaQuery.of(context).size.height * 0.4,
              child: detailsDescriptionCard(context),
            )
          ],
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(50),
            ),
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove),
                        color: Colors.white,
                      ),
                      const Text(
                        '1',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container detailsDescriptionCard(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(15), topEnd: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Waterproof Trouser",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text(
              "Rs. 1300",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(16)),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "4.6",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text("(320 Review)")
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Color",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: List.generate(
                  5,
                  (index) => IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        icon: const Icon(Icons.circle),
                        iconSize: 40,
                        color: colors[index],
                      )),
            ),
            const SizedBox(
              height: 15,
            ),
            TabBar(
              tabs: const [
                TabCard(
                  text: "Description",
                ),
                TabCard(
                  text: "Specifications",
                ),
                TabCard(
                  text: "Reviews",
                ),
              ],
              indicator: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(20)),
              // indicatorSize: TabBarIndicatorSize.label,
            ),
            Container(
                height: 800,
                color: Colors.white,
                child: const TabBarView(children: [
                  Text("Wind/Waterproof Trouser for men having fur inside.."),
                  Text(
                    "Specifications go here.",
                  ),
                  Text(
                    "Customer reviews go here.",
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}
