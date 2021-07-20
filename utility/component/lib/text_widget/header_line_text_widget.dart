import 'package:flutter/material.dart';

class HeaderLineTextWidget extends StatelessWidget {
  final String value;
  final bool? isCenter;

  HeaderLineTextWidget({
    required this.value,
    this.isCenter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isCenter != null ? Alignment.center : Alignment.centerLeft,
      child: Text(
        value,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.shortestSide * 0.075,
        ),
      ),
    );
  }
}
