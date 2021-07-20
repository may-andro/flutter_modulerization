import 'package:flutter/material.dart';

class LabelTextWidget extends StatelessWidget {
  final String label;
  final bool? isCenter;

  LabelTextWidget({required this.label, this.isCenter});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isCenter != null ? Alignment.center : Alignment.centerLeft,
      child: Text(
        label,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.shortestSide * 0.025,
        ),
      ),
    );
  }
}
