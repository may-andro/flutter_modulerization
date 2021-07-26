import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalenderListSelectionState {
  CalenderListSelectionState({
    this.selectedDate,
  });

  final DateTime? selectedDate;

  CalenderListSelectionState copy({
    DateTime? selectedDate,
  }) {
    return CalenderListSelectionState(
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }
}

class CalenderListSelectionStateNotifier extends StateNotifier<CalenderListSelectionState> {
  CalenderListSelectionStateNotifier() : super(CalenderListSelectionState());

  void selectDate(DateTime date) {
    state = state.copy(selectedDate: date);
  }
}
