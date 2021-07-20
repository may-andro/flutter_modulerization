import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  final String label;
  final bool? isCenter;

  TitleTextWidget({required this.label, this.isCenter});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isCenter != null ? Alignment.center : Alignment.centerLeft,
      child: Text(
        label,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.shortestSide * 0.0450,
        ),
      ),
    );
  }
}
