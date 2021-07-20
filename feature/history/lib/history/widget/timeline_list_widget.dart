import 'package:flutter/material.dart';
import 'package:history/history/model/pollutant_list_item.dart';

import 'item_date_header_widget.dart';
import 'item_pollutant_widget.dart';

class TimelineListWidget extends StatelessWidget {
  const TimelineListWidget({
    Key? key,
    required this.pollutantItemList,
    required this.onItemClick,
  }) : super(key: key);

  final List<PollutantListItem> pollutantItemList;
  final Function(PollutantItem) onItemClick;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildTimeline(),
        NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                    color: Colors.transparent,
                  ),
              itemCount: pollutantItemList.length,
              itemBuilder: (context, index) {
                return pollutantItemList[index].map(
                  headerItem: (HeaderItem header) => ItemDateHeaderWidget(
                    headerItem: pollutantItemList[index] as HeaderItem,
                  ),
                  pollutantItem: (PollutantItem item) => InkWell(
                    onTap: () => onItemClick(item),
                    child: ItemPollutantWidget(
                      pollutantItem: pollutantItemList[index] as PollutantItem,
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget buildTimeline() {
    return Positioned(
      top: 0.0,
      bottom: 0.0,
      left: 40.0,
      child: Container(
        width: 1.0,
        color: Colors.white,
      ),
    );
  }
}
