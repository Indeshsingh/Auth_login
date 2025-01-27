import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatelessWidget {
  ImageSlider({super.key});

  final PageController _pageController = PageController();
  final List<String> images = [
    "assets/img/slider.png",
    "assets/img/slider1.jpg",
    "assets/img/slider2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.999,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              physics: const ClampingScrollPhysics(),
              children: List.generate(
                  3,
                  (index) => Image.asset(
                        images[index],
                        fit: BoxFit.fill,
                      )),
              // children: [
              //   Image.asset(
              //     "assets/img/slider.png",
              //     fit: BoxFit.fill,
              //   ),
              //   Image.asset(
              //     "assets/img/slider1.jpg",
              //     fit: BoxFit.fill,
              //   ),
              //   Image.asset(
              //     "assets/img/slider2.jpg",
              //     fit: BoxFit.fill,
              //   ),
              // ],
            ),
          ),
        ),
        // SmoothPageIndicator at the bottom
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            controller: _pageController, // PageController
            count: 3, // Number of pages
            effect: const ExpandingDotsEffect(
              activeDotColor: Colors.black,
              dotColor: Colors.orange,
              dotHeight: 8,
              dotWidth: 8,
              spacing: 8,
            ),
          ),
        ),
        Positioned(
            bottom: 10,
            left: 7,
            child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.deepOrange)),
              onPressed: () {},
              child: const Text(
                "Shop Now",
                //strutStyle: StrutStyle(fontSize: 8),
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ))
      ],
    );
  }
}
