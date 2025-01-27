import 'package:flutter/material.dart';
import 'package:login/screens/home/constants.dart';

class Customwidget extends StatelessWidget {
  const Customwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: const EdgeInsets.all(20)),
          onPressed: () {},
          icon: Image.asset(
            "assets/icon.png",
            height: 20,
            width: 21,
          ),
        ),
        // const SizedBox(
        //   width: 210,
        // ),
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: const EdgeInsets.all(20)),
          onPressed: () {},
          iconSize: 30,
          icon: const Icon(Icons.notification_add_outlined),
        )
      ],
    );
  }
}
