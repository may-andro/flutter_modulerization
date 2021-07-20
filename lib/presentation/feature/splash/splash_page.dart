import 'package:air_quality/app/app_state/provider/app_state_provider.dart';
import 'package:air_quality/presentation/feature/splash/provider/splash_page_provider.dart';
import 'package:air_quality/presentation/routes/app_route.gr.dart';
import 'package:common/common.dart';
import 'package:component/error/error_state_widget.dart';
import 'package:component/text_widget/label_text_widget.dart';
import 'package:component/text_widget/sub_title_text_widget.dart';
import 'package:domain/entity/user_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

final logger = AppLogger.setLogTag('SplashPage');

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody2(),
    );
  }

  Widget _buildBody() {
    return Consumer(builder: (context, watch, child) {
      final userLocation = watch(userLocationProvider);
      AppLogger.logDebug('_buildBody: ${userLocation.toString()}', logger: logger);
      return userLocation.when(
        data: (data) => _buildSuccessState(data, context),
        loading: () => _buildLoadingWidget(),
        error: (error, stack) => _buildErrorState(error),
      );
    });
  }

  Widget _buildBody2() {
    return Consumer(builder: (context, watch, child) {
      final _appState = watch(appStateProvider);
      final userLocation = _appState.getCurrentLocation();
      AppLogger.logDebug('_buildBody: ${userLocation.toString()}', logger: logger);

      if (userLocation == null) {
        return _buildLoadingWidget();
      }

      return _buildSuccessState(userLocation, context);
    });
  }

  Widget _buildLoadingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.location_searching,
          size: 100,
        ),
        SizedBox(height: 32),
        LabelTextWidget(
          label: 'Getting user location',
          isCenter: true,
        ),
        SizedBox(height: 32),
        CircularProgressIndicator(),
        SizedBox(height: 32),
      ],
    );
  }

  Widget _buildSuccessState(UserLocation userLocation, BuildContext context) {
    AppLogger.logDebug('_buildSuccessState data: ${userLocation.toString()}', logger: logger);
    final _appState = context.read(appStateProvider);
    _appState.copy(newUserLocation: userLocation);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.location_searching,
          size: 100,
        ),
        SizedBox(height: 32),
        LabelTextWidget(
          label: 'Location Found!',
          isCenter: true,
        ),
        SizedBox(height: 32),
        SubTitleTextWidget(
          value: 'You are at: ${userLocation.cityName}',
          isCenter: true,
        ),
        SizedBox(height: 32),
        MaterialButton(
          color: Colors.red,
          onPressed: () => context.router.push(HomeRoute()),
          child: Text('Get Started!'),
        ),
        SizedBox(height: 32),
      ],
    );
  }

  Widget _buildErrorState(Object exception) {
    return ErrorStateWidget(
      error: 'error ${exception.toString()}',
    );
  }
}
