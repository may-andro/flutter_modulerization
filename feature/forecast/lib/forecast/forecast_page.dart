import 'package:common/common.dart';
import 'package:component/error/error_state_widget.dart';
import 'package:component/loading/loading_widget.dart';
import 'package:domain/entity/pollutant.dart';
import 'package:domain/utils/result_state/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forecast/forecast/model/forecast_ui_model.dart';
import 'package:forecast/forecast/widget/ForecastDateTabWidget.dart';

import 'provider/forecast_page_provider.dart';

final logger = AppLogger.setLogTag('ForecastPage');

class ForecastPage extends StatelessWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Forecast'),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Consumer(builder: (context, watch, child) {
      final response = watch(provideAirPollutantForecast);
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
        final uiList = watch(provideAirPollutantMap(pollutantList));
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
    Map<String, List<ForecastUiModel>> pollutantMap,
    BuildContext context,
  ) {
    return ForecastDateTabWidget(pollutantMap: pollutantMap);
  }
}
