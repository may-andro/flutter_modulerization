import 'package:component/text_widget/label_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:forecast/forecast/model/forecast_ui_model.dart';

import 'item_timed_component_widget.dart';

class ForecastDateTabWidget extends StatefulWidget {
  const ForecastDateTabWidget({
    Key? key,
    required this.pollutantMap,
  }) : super(key: key);

  final Map<String, List<ForecastUiModel>> pollutantMap;

  @override
  _ForecastDateTabWidgetState createState() => _ForecastDateTabWidgetState();
}

class _ForecastDateTabWidgetState extends State<ForecastDateTabWidget> with TickerProviderStateMixin {
  late List<String> tabList;

  List<Widget> _tabs = [];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    tabList = widget.pollutantMap.keys.toList();
    tabList.forEach((date) {
      _tabs.add(_createTab(date));
    });

    _tabController = TabController(length: tabList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _createTab(String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.brown,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        child: LabelTextWidget(
          label: text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 8),
        _createTabs(),
        Expanded(child: _createPager()),
      ],
    );
  }

  Widget _createTabs() {
    return TabBar(
      tabs: _tabs,
      controller: _tabController,
      isScrollable: true,
      indicatorWeight: 0,
      labelPadding: EdgeInsets.symmetric(horizontal: 4),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.brown,
        border: Border.all(
          color: Colors.brown,
          width: 2,
        ),
      ),
      unselectedLabelColor: Colors.brown,
      labelColor: Colors.white,
      onTap: (pos) {},
    );
  }

  Widget _createPager() {
    return PageView.builder(
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: tabList.length,
      onPageChanged: (pos) {},
      itemBuilder: (context, position) {
        return _createList(widget.pollutantMap[tabList[position]]);
      },
    );
  }



  Widget _createList(List<ForecastUiModel>? list) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                color: Colors.transparent,
              ),
          itemCount: list!.length,
          itemBuilder: (context, index) {
            return ItemTimedComponentWidget(
              forecastUiModel: list[index],
            );
          }),
    );
  }
}
