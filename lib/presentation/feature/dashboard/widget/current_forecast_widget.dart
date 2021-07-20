import 'package:air_quality/app/app_state/provider/app_state_provider.dart';
import 'package:air_quality/presentation/routes/app_route.gr.dart';
import 'package:component/text_widget/header_line_text_widget.dart';
import 'package:component/text_widget/label_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/all.dart';

import 'country_widget.dart';

class CurrentForecastWidget extends StatelessWidget {
  const CurrentForecastWidget({Key? key, required this.airQuality}) : super(key: key);

  final String airQuality;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 8,
        ),
        _buildTitleRow(context),
        SizedBox(
          height: 16,
        ),
        HeaderLineTextWidget(
          value: airQuality,
          isCenter: true,
        ),
        SizedBox(
          height: 4,
        ),
        LabelTextWidget(
          label: 'Air Quality',
          isCenter: true,
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget _buildTitleRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 16,
        ),
        _buildCountryNameWidget(),
        Spacer(),
        IconButton(
          onPressed: () => context.router.push(HistoryRoute()),
          icon: Icon(
            Icons.history_rounded,
            size: 24.0,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: () => context.router.push(ForecastRoute()),
          icon: Icon(
            Icons.assessment_rounded,
            size: 24.0,
          ),
        ),
        SizedBox(
          width: 16,
        ),
      ],
    );
  }

  Widget _buildCountryNameWidget() {
    return Consumer(builder: (context, watch, child) {
      final _appState = watch(appStateProvider);
      final userLocation = _appState.getCurrentLocation();

      if (userLocation == null) {
        return CountryWidget(label: 'Not Found');
      }

      return CountryWidget(label: userLocation.cityName);
    });
  }
}
