import 'package:common/common.dart';
import 'package:component/table/pollutant_table/model/component_table_item.dart';
import 'package:domain/entity/component.dart';
import 'package:flutter/material.dart';

class ComponentTableListMapper implements UnidirectionalObjectMapper<Component, List<ComponentTableItem>> {
  @override
  List<ComponentTableItem> to(Component component) {
    List<ComponentTableItem> componentList = [];
    componentList.add(ComponentTableItem(
      label: "Ammonia",
      value: '${component.ammonia} μg/m3',
      color: Colors.white,
    ));
    componentList.add(ComponentTableItem(
      label: "Carbon Monoxide",
      value: '${component.carbonMonoxide} μg/m3',
      color: Colors.white,
    ));
    componentList.add(ComponentTableItem(
      label: "Coarse Particle",
      value: '${component.coarseParticle} μg/m3',
      color: Colors.white,
    ));
    componentList.add(ComponentTableItem(
      label: "Fine Particle",
      value: '${component.fineParticles} μg/m3',
      color: Colors.white,
    ));
    componentList.add(ComponentTableItem(
      label: "Nitrogen Dioxide",
      value: '${component.nitrogenDioxide} μg/m3',
      color: Colors.white,
    ));
    componentList.add(ComponentTableItem(
      label: "Nitrogen Monoxide",
      value: '${component.nitrogenMonoxide} μg/m3',
      color: Colors.white,
    ));
    componentList.add(ComponentTableItem(
      label: "Ozone",
      value: '${component.ozone} μg/m3',
      color: Colors.white,
    ));
    return componentList;
  }
}
