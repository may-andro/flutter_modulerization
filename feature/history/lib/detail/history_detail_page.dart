import 'package:component/error/error_state_widget.dart';
import 'package:component/loading/loading_widget.dart';
import 'package:component/table/pollutant_table/pollutant_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:history/history/model/pollutant_list_item.dart';

import 'provider/history_detail_page_provider.dart';

class HistoryDetailPage extends StatelessWidget {
  const HistoryDetailPage({
    Key? key,
    required this.pollutantItem,
  }) : super(key: key);

  final PollutantItem pollutantItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${pollutantItem.airQuality} at ${pollutantItem.time}',
          ),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Consumer(builder: (context, watch, child) {
      final response = watch(provideComponentTableList(pollutantItem.component));
      return response.when(
        data: (data) => PollutantTableWidget(componentList: data),
        loading: () => LoadingWidget(),
        error: (error, stack) => ErrorStateWidget(error: error.toString()),
      );
    });
  }
}
