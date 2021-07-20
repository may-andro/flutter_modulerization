import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'widget/theme_setting_widget.dart';

final logger = AppLogger.setLogTag('SettingPage');

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Setting'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildThemeRowWidget(),
        ],
      ),
    );
  }

  Widget _buildThemeRowWidget() {
    return ThemeSettingWidget();
  }
}
