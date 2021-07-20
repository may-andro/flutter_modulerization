import 'package:component/text_widget/sub_title_text_widget.dart';
import 'package:component/text_widget/title_text_widget.dart';
import 'package:flutter/material.dart';

import 'model/component_table_item.dart';

class PollutantTableWidget extends StatelessWidget {
  const PollutantTableWidget({
    Key? key,
    required this.componentList,
  }) : super(key: key);

  final List<ComponentTableItem> componentList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: DataTable(
          horizontalMargin: 16,
          columnSpacing: 32,
          columns: [
            getTitleDataColumn('Component'),
            getTitleDataColumn('Value'),
          ],
          rows: componentList.map((component) {
            return DataRow(cells: [
              getDataCell(component.label),
              getDataCell(component.value),
            ]);
          }).toList(),
        ),
      ),
    );
  }

  DataColumn getTitleDataColumn(String label) {
    return DataColumn(
      label: TitleTextWidget(
        label: label,
      ),
    );
  }

  DataCell getDataCell(String label) {
    return DataCell(
      SubTitleTextWidget(
        value: label,
      ),
    );
  }
}
