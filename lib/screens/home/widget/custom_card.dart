import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? imagepath;
  final double? imagesize;
  final double height;
  final double width;
  final String title;
  final String price;
  const CustomCard(
      {required this.height,
      required this.width,
      this.imagepath,
      this.imagesize,
      super.key,
      required this.title,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              // image: DecorationImage(image: AssetImage(imagepath ?? "")),
              color: const Color.fromARGB(26, 121, 117, 117),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Image.asset(
                "assets/img/electronics_-removebg-preview.png",
                fit: BoxFit.contain,
              )
                  //     Image.network(
                  //   imagepath ?? "",
                  //   fit: BoxFit.contain,
                  // ),
                  ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8))),
            height: 33,
            width: 33,
            child: const Icon(Icons.favorite_border),
          ),
        ),
        Positioned(
          left: 5,
          bottom: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Row(
                children: [
                  Text(
                    price,
                    style: const TextStyle(color: Colors.orange),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
