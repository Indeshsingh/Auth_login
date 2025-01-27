import 'package:flutter/material.dart';

class TabCard extends StatelessWidget {
  final String? text;
  const TabCard({this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text ?? "",
        style: const TextStyle(color: Colors.black, fontSize: 13),
      ),
    );
  }
}
