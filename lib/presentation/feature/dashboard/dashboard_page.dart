import 'package:domain/entity/pollutant.dart';
import 'package:domain/utils/result_state/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dashboard_view_model.dart';
import 'provider/dashboard_page_provider.dart';
import 'widget/component_grid_widget.dart';
import 'widget/current_forecast_widget.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final viewModel = context.read(dashboardViewModelProvider);
    final response = watch(provideCurrentAirPollutant);
    print('DashboardTab.build response $response');
    return response.when(
      data: (data) => _buildUIState(data, viewModel),
      loading: () => _buildLoadingState(),
      error: (error, stack) => _buildErrorState(error as Exception, viewModel),
    );
  }

  Widget _buildUIState(Result<List<Pollutant>> data, DashboardViewModel viewModel) {
    if (data is Success) {
      final pollutant = (data as Success<List<Pollutant>>).data.first;

      return _buildSuccessState(viewModel.getComponentMap(pollutant), viewModel.getAirQualityLabel(pollutant.aqi));
    }
    if (data is Loading) {
      return _buildLoadingState();
    }
    if (data is Error) {
      return _buildErrorState((data as Error).error, viewModel);
    }
    return Offstage();
  }

  Widget _buildSuccessState(Map<String, double> componentMap, String airQuality) {
    return Column(
      children: [
        CurrentForecastWidget(airQuality: airQuality),
        SizedBox(
          height: 24,
        ),
        Expanded(child: ComponentGridWidget(componentMap: componentMap)),
      ],
    );
  }

  Widget _buildErrorState(Object error, DashboardViewModel viewModel) {
    return Center(child: Text(viewModel.getErrorMessage(error)));
  }

  Widget _buildLoadingState() {
    return Center(child: CircularProgressIndicator());
  }
}
