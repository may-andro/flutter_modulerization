import 'package:air_quality/presentation/feature/dashboard/dashboard_page.dart';
import 'package:air_quality/presentation/feature/setting/setting_page.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_tabs_state.dart';
import 'widget/bottom_navigation/tab_item_widget.dart';

class HomePage extends StatelessWidget {
  final logger = AppLogger.setLogTag('HomePage');

  @override
  Widget build(BuildContext context) {
    AppLogger.logDebug('build method', logger: logger);
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _buildFab(context),
        bottomNavigationBar: _buildBottomAppBar(),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Consumer(builder: (context, watch, child) {
      final bottomNavigationState = watch(bottomNavigationNotifierProvider);
      if (bottomNavigationState.selectedPosition == 0) return DashboardPage();
      if (bottomNavigationState.selectedPosition == 1) return SettingPage();
      throw Exception();
    });
  }

  Widget _buildFab(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final bottomNavigationState = watch(bottomNavigationNotifierProvider);
      if (bottomNavigationState.selectedPosition == 0) {
        return FloatingActionButton(
          child: Icon(
            Icons.add_location,
          ),
          onPressed: () => Navigator.pushNamed(context, '/add_location'),
        );
      }
      if (bottomNavigationState.selectedPosition == 1) {
        return FloatingActionButton(
          child: Icon(
            Icons.feedback_rounded,
          ),
          onPressed: () => Navigator.pushNamed(context, '/add_location'),
        );
      }
      throw Exception();
    });
  }

  Widget _buildBottomAppBar() {
    return Consumer(builder: (context, watch, child) {
      final bottomNavigationState = watch(bottomNavigationNotifierProvider);
      final bottomNavigationNotifier = watch(bottomNavigationNotifierProvider.notifier);
      return BottomAppBar(
        color: Colors.blueGrey,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TabItemWidget(
                icon: Icons.home,
                onTap: () {
                  bottomNavigationNotifier.selectTab(0);
                },
                isSelected: bottomNavigationState.selectedPosition == 0,
              ),
              SizedBox(
                width: 40,
              ), // The dummy child
              TabItemWidget(
                icon: Icons.settings,
                onTap: () {
                  bottomNavigationNotifier.selectTab(1);
                },
                isSelected: bottomNavigationState.selectedPosition == 1,
              ),
            ],
          ),
        ),
      );
    });
  }
}
