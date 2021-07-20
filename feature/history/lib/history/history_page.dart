import 'package:air_quality/presentation/routes/app_route.gr.dart';
import 'package:common/common.dart';
import 'package:component/error/error_state_widget.dart';
import 'package:component/loading/loading_widget.dart';
import 'package:domain/entity/pollutant.dart';
import 'package:domain/utils/result_state/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

import 'model/pollutant_list_item.dart';
import 'provider/history_page_provider.dart';
import 'widget/timeline_list_widget.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);
  final logger = AppLogger.setLogTag('HistoryPage');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('History'),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Consumer(builder: (context, watch, child) {
      final response = watch(provideAirPollutantHistory);
      AppLogger.logDebug('_buildBody api response; $response', logger: logger);

      return response.when(
        data: (data) => _buildUIState(data, context),
        loading: () => _buildLoadingState(),
        error: (error, stack) => _buildErrorState(error as Exception, context),
      );
    });
  }

  Widget _buildUIState(Result<List<Pollutant>> data, BuildContext context) {
    if (data is Success) {
      return Consumer(builder: (context, watch, child) {
        final pollutantList = (data as Success<List<Pollutant>>).data;
        AppLogger.logWarning('_buildUIState before pollutantList; ${pollutantList.length}', logger: logger);
        final uiList = watch(provideAirPollutantList(pollutantList));
        return uiList.when(
          data: (data) => _buildSuccessState(data, context),
          loading: () => _buildLoadingState(),
          error: (error, stack) => _buildErrorState(error as Exception, context),
        );
      });
    }
    if (data is Loading) {
      return _buildLoadingState();
    }
    if (data is Error) {
      return _buildErrorState((data as Error).error, context);
    }
    return Offstage();
  }

  Widget _buildErrorState(
    Object error,
    BuildContext context,
  ) {
    return ErrorStateWidget(error: error.toString());
  }

  Widget _buildLoadingState() {
    return LoadingWidget();
  }

  _buildSuccessState(
    List<PollutantListItem> pollutantItemList,
    BuildContext context,
  ) {
    return TimelineListWidget(
      pollutantItemList: pollutantItemList,
      onItemClick: (pollutantItem) => goToDetailPage(pollutantItem, context),
    );
  }

  void goToDetailPage(PollutantItem pollutantItem, BuildContext context) {
    context.router.push(HistoryDetailRoute(pollutantItem: pollutantItem));
  }
}
