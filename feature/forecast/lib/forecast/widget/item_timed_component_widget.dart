import 'package:domain/entity/component.dart';
import 'package:flutter/material.dart';
import 'package:forecast/forecast/model/forecast_ui_model.dart';

class ItemTimedComponentWidget extends StatelessWidget {
  const ItemTimedComponentWidget({
    Key? key,
    required this.forecastUiModel,
  }) : super(key: key);

  final ForecastUiModel forecastUiModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildTimeWidget(),
          _buildAiqWidget(),
          _buildComponentChipsWidget(context),
        ],
      ),
    );
  }

  List<String> getComponentList(Component component) {
    final List<String> componentList = [];
    componentList.add("Ammonia ${component.ammonia}");
    componentList.add("Carbon Monoxide: ${component.carbonMonoxide}");
    componentList.add("Coarse Particle: ${component.coarseParticle}");
    componentList.add("Fine Particles: ${component.fineParticles}");
    componentList.add("Nitrogen Dioxide: ${component.nitrogenDioxide}");
    componentList.add("Nitrogen Monoxide: ${component.nitrogenMonoxide}");
    componentList.add("Ozone: ${component.ozone}");
    return componentList;
  }

  Map<String, double> getComponentMap(Component component) {
    final Map<String, double> componentMap = Map<String, double>();
    componentMap.putIfAbsent("Ammonia", () => component.ammonia);
    componentMap.putIfAbsent("Carbon Monoxide", () => component.carbonMonoxide);
    componentMap.putIfAbsent("Coarse Particle", () => component.coarseParticle);
    componentMap.putIfAbsent("Fine Particles", () => component.fineParticles);
    componentMap.putIfAbsent("Nitrogen Dioxide", () => component.nitrogenDioxide);
    componentMap.putIfAbsent("Nitrogen Monoxide", () => component.nitrogenMonoxide);
    componentMap.putIfAbsent("Ozone", () => component.ozone);
    return componentMap;
  }

  Widget _buildTimeWidget() {
    return Text('at ${forecastUiModel.time}');
  }

  Widget _buildAiqWidget() {
    return Text('Air Quality: ${forecastUiModel.time}');
  }

  Widget _buildComponentChipsWidget(BuildContext context) {
    final widgetList = getComponentMap(forecastUiModel.component)
        .map((key, value) => MapEntry(
            key,
            Chip(
              labelPadding: EdgeInsets.all(0.0),
              label: Column(
                children: [
                  Text(
                    key,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white, fontSize: 10),
                  ),
                  Text(
                    '${value}',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white, fontSize: 10),
                  )
                ],
              ),
              elevation: 1,
            )))
        .values
        .toList();
    return Wrap(
      spacing: 8,
      runSpacing: -8,
      children: widgetList,
    );
  }
}
