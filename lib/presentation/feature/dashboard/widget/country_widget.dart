import 'package:component/text_widget/label_text_widget.dart';
import 'package:flutter/material.dart';

class CountryWidget extends StatelessWidget {
  const CountryWidget({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
        child: Row(
          children: [
            Icon(
              Icons.language_rounded,
              size: 24.0,
            ),
            SizedBox(
              width: 8,
            ),
            LabelTextWidget(
              label: label,
            ),
          ],
        ),
      ),
    );
  }
}
