import 'package:component/text_widget/sub_title_text_widget.dart';
import 'package:component/text_widget/title_text_widget.dart';
import 'package:flutter/material.dart';

class ComponentCardWidget extends StatelessWidget {
  const ComponentCardWidget({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitleTextWidget(
          label: '$value μg/m3',
          isCenter: true,
        ),
        SubTitleTextWidget(
          value: label,
          isCenter: true,
        ),
      ],
    );
  }
}
