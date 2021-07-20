import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigation {
  BottomNavigation({
    this.selectedPosition = 0,
  });

  final int selectedPosition;

  BottomNavigation copy({
    int? position,
  }) {
    return BottomNavigation(
      selectedPosition: position ?? this.selectedPosition,
    );
  }
}

class BottomNavigationNotifier extends StateNotifier<BottomNavigation> {
  BottomNavigationNotifier() : super(BottomNavigation());

  void selectTab(
    int position,
  ) {
    state = state.copy(position: position);
  }
}

final bottomNavigationNotifierProvider =
    StateNotifierProvider<BottomNavigationNotifier, BottomNavigation>((ref) => BottomNavigationNotifier());
