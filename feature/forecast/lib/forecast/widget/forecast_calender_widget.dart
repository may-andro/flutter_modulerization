import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:forecast/forecast/model/forecast_list_item.dart';
import 'package:table_calendar/table_calendar.dart';

final _logger = AppLogger.setLogTag('CalenderWidget');

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({
    Key? key,
    required this.selectedDate,
    required this.onDaySelected,
    required this.forecastMap,
  }) : super(key: key);

  final Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;
  final Map<DateTime, List<ForecastListItem>> forecastMap;

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: selectedDate,
      firstDay: forecastMap.keys.first,
      lastDay: forecastMap.keys.last,
      calendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      daysOfWeekVisible: true,

      //Day Changed
      onDaySelected: onDaySelected,
      selectedDayPredicate: (DateTime date) {
        return isSameDay(selectedDate, date);
      },

      eventLoader: (date) => forecastMap[date] ?? List.empty(),

      //To style the Calendar
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        outsideDaysVisible: false,
        disabledTextStyle: TextStyle(
          color: Theme.of(context).disabledColor,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5.0),
        ),
        defaultDecoration: BoxDecoration(
          color: Colors.blueGrey,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5.0),
        ),
        defaultTextStyle: TextStyle(
          color: Colors.white,
        ),
        weekendDecoration: BoxDecoration(
          color: Colors.blueGrey,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5.0),
        ),
        selectedTextStyle: TextStyle(
          color: Colors.white,
        ),
        weekendTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        formatButtonShowsNext: false,
        formatButtonDecoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5.0),
        ),
        formatButtonTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
