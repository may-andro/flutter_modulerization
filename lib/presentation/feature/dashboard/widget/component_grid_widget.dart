import 'package:flutter/material.dart';

import 'component_card_widget.dart';

class ComponentGridWidget extends StatelessWidget {
  const ComponentGridWidget({
    Key? key,
    required this.componentMap,
  }) : super(key: key);

  final Map<String, double> componentMap;

  @override
  Widget build(BuildContext context) {
    int gridViewCrossAxisCount = 2;

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridViewCrossAxisCount,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          itemCount: componentMap.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext ctx, index) {
            final label = componentMap.keys.elementAt(index);
            final value = componentMap.values.elementAt(index);
            return Container(
              decoration: myBoxDecoration(
                context,
                index,
                gridViewCrossAxisCount,
              ),
              child: ComponentCardWidget(
                label: label,
                value: '$value',
              ),
            );
          }),
    );
  }

  BoxDecoration myBoxDecoration(
    BuildContext context,
    int index,
    int gridViewCrossAxisCount,
  ) {
    index++;
    final dividerColor = Theme.of(context).accentColor;
    return BoxDecoration(
      color: Colors.transparent,
      border: Border(
        right: BorderSide(
          color: index % gridViewCrossAxisCount != 0 ? dividerColor : Colors.transparent,
          width: index % gridViewCrossAxisCount != 0 ? 1 : 0,
        ),
        top: BorderSide(
          color: index <= gridViewCrossAxisCount ? dividerColor : Colors.transparent,
          width: index <= gridViewCrossAxisCount ? 1 : 0,
        ),
        bottom: BorderSide(
          color: dividerColor,
          width: 1,
        ),
      ),
    );
  }
}
