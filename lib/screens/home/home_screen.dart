import 'package:flutter/material.dart';
import 'package:login/screens/Details/details_screen.dart';
import 'package:login/screens/home/widget/custom_card.dart';
import 'package:login/screens/home/widget/home_appbar.dart';
import 'package:login/screens/home/widget/image_slider.dart';
import 'package:login/screens/home/widget/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35,
                ),

                // for custom appbar
                const Customwidget(),
                const SizedBox(
                  height: 20,
                ),
                // for searchbar
                const MysearchBar(),
                const SizedBox(
                  height: 20,
                ),
                ImageSlider(),
                const SizedBox(
                  height: 10,
                ),
                const RowItems(),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Special For You",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // SpecialItems(

                // ),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    specialItem: null,
                                  )));
                    },
                    child: CustomCard(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.2,
                      title: "",
                      // title: state.products[index].title ?? "",
                      imagepath: "",
                      // imagepath: state.products[index].image ?? "",
                      price: "",

                      //price: state.products[index].price ?? "",
                    ),
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 180,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class RowItems extends StatelessWidget {
  const RowItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
        6,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            // color: Colors.red,
            width: MediaQuery.of(context).size.width * 0.2,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage:
                      AssetImage("assets/img/men-removebg-preview.png"),
                  //child:
                  //    SizedBox(height: 200, child: Text(Apphelper.categoryName[index])),
                ),
                Text(""
                    //  maxLines: 1,
                    )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

// class SpecialItems extends StatelessWidget {
//   final String title;
//   final int itemLength;
//   const SpecialItems(
//       {super.key, required this.title, required this.itemLength});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: itemLength,
//       itemBuilder: (context, index) => InkWell(
//         onTap: () {
//           // Navigator.push(context,
//           //     MaterialPageRoute(builder: (context) => DetailsScreen()));
//         },
//         child: CustomCard(
//           title: title,
//           height: 20,
//           width: MediaQuery.of(context).size.width,
//           imagepath: "assets/img/men-removebg-preview.png",
//         ),
//       ),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 20,
//         crossAxisSpacing: 20,
//         mainAxisExtent: 180,
//       ),
//     );
//   }
// }
