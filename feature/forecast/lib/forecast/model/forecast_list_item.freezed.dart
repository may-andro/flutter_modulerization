// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'forecast_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ForecastListItemTearOff {
  const _$ForecastListItemTearOff();

  HeaderItem headerItem({required DateTime date}) {
    return HeaderItem(
      date: date,
    );
  }

  ForecastItem forecastItem(
      {required String time,
      required Color background,
      required String airQuality,
      required Component component}) {
    return ForecastItem(
      time: time,
      background: background,
      airQuality: airQuality,
      component: component,
    );
  }
}

/// @nodoc
const $ForecastListItem = _$ForecastListItemTearOff();

/// @nodoc
mixin _$ForecastListItem {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) headerItem,
    required TResult Function(String time, Color background, String airQuality,
            Component component)
        forecastItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? headerItem,
    TResult Function(String time, Color background, String airQuality,
            Component component)?
        forecastItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HeaderItem value) headerItem,
    required TResult Function(ForecastItem value) forecastItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeaderItem value)? headerItem,
    TResult Function(ForecastItem value)? forecastItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastListItemCopyWith<$Res> {
  factory $ForecastListItemCopyWith(
          ForecastListItem value, $Res Function(ForecastListItem) then) =
      _$ForecastListItemCopyWithImpl<$Res>;
}

/// @nodoc
class _$ForecastListItemCopyWithImpl<$Res>
    implements $ForecastListItemCopyWith<$Res> {
  _$ForecastListItemCopyWithImpl(this._value, this._then);

  final ForecastListItem _value;
  // ignore: unused_field
  final $Res Function(ForecastListItem) _then;
}

/// @nodoc
abstract class $HeaderItemCopyWith<$Res> {
  factory $HeaderItemCopyWith(
          HeaderItem value, $Res Function(HeaderItem) then) =
      _$HeaderItemCopyWithImpl<$Res>;
  $Res call({DateTime date});
}

/// @nodoc
class _$HeaderItemCopyWithImpl<$Res>
    extends _$ForecastListItemCopyWithImpl<$Res>
    implements $HeaderItemCopyWith<$Res> {
  _$HeaderItemCopyWithImpl(HeaderItem _value, $Res Function(HeaderItem) _then)
      : super(_value, (v) => _then(v as HeaderItem));

  @override
  HeaderItem get _value => super._value as HeaderItem;

  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(HeaderItem(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$HeaderItem implements HeaderItem {
  const _$HeaderItem({required this.date});

  @override
  final DateTime date;

  @override
  String toString() {
    return 'ForecastListItem.headerItem(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HeaderItem &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(date);

  @JsonKey(ignore: true)
  @override
  $HeaderItemCopyWith<HeaderItem> get copyWith =>
      _$HeaderItemCopyWithImpl<HeaderItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) headerItem,
    required TResult Function(String time, Color background, String airQuality,
            Component component)
        forecastItem,
  }) {
    return headerItem(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? headerItem,
    TResult Function(String time, Color background, String airQuality,
            Component component)?
        forecastItem,
    required TResult orElse(),
  }) {
    if (headerItem != null) {
      return headerItem(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HeaderItem value) headerItem,
    required TResult Function(ForecastItem value) forecastItem,
  }) {
    return headerItem(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeaderItem value)? headerItem,
    TResult Function(ForecastItem value)? forecastItem,
    required TResult orElse(),
  }) {
    if (headerItem != null) {
      return headerItem(this);
    }
    return orElse();
  }
}

abstract class HeaderItem implements ForecastListItem {
  const factory HeaderItem({required DateTime date}) = _$HeaderItem;

  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeaderItemCopyWith<HeaderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastItemCopyWith<$Res> {
  factory $ForecastItemCopyWith(
          ForecastItem value, $Res Function(ForecastItem) then) =
      _$ForecastItemCopyWithImpl<$Res>;
  $Res call(
      {String time, Color background, String airQuality, Component component});
}

/// @nodoc
class _$ForecastItemCopyWithImpl<$Res>
    extends _$ForecastListItemCopyWithImpl<$Res>
    implements $ForecastItemCopyWith<$Res> {
  _$ForecastItemCopyWithImpl(
      ForecastItem _value, $Res Function(ForecastItem) _then)
      : super(_value, (v) => _then(v as ForecastItem));

  @override
  ForecastItem get _value => super._value as ForecastItem;

  @override
  $Res call({
    Object? time = freezed,
    Object? background = freezed,
    Object? airQuality = freezed,
    Object? component = freezed,
  }) {
    return _then(ForecastItem(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      background: background == freezed
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as Color,
      airQuality: airQuality == freezed
          ? _value.airQuality
          : airQuality // ignore: cast_nullable_to_non_nullable
              as String,
      component: component == freezed
          ? _value.component
          : component // ignore: cast_nullable_to_non_nullable
              as Component,
    ));
  }
}

/// @nodoc

class _$ForecastItem implements ForecastItem {
  const _$ForecastItem(
      {required this.time,
      required this.background,
      required this.airQuality,
      required this.component});

  @override
  final String time;
  @override
  final Color background;
  @override
  final String airQuality;
  @override
  final Component component;

  @override
  String toString() {
    return 'ForecastListItem.forecastItem(time: $time, background: $background, airQuality: $airQuality, component: $component)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ForecastItem &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.background, background) ||
                const DeepCollectionEquality()
                    .equals(other.background, background)) &&
            (identical(other.airQuality, airQuality) ||
                const DeepCollectionEquality()
                    .equals(other.airQuality, airQuality)) &&
            (identical(other.component, component) ||
                const DeepCollectionEquality()
                    .equals(other.component, component)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(background) ^
      const DeepCollectionEquality().hash(airQuality) ^
      const DeepCollectionEquality().hash(component);

  @JsonKey(ignore: true)
  @override
  $ForecastItemCopyWith<ForecastItem> get copyWith =>
      _$ForecastItemCopyWithImpl<ForecastItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) headerItem,
    required TResult Function(String time, Color background, String airQuality,
            Component component)
        forecastItem,
  }) {
    return forecastItem(time, background, airQuality, component);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? headerItem,
    TResult Function(String time, Color background, String airQuality,
            Component component)?
        forecastItem,
    required TResult orElse(),
  }) {
    if (forecastItem != null) {
      return forecastItem(time, background, airQuality, component);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HeaderItem value) headerItem,
    required TResult Function(ForecastItem value) forecastItem,
  }) {
    return forecastItem(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeaderItem value)? headerItem,
    TResult Function(ForecastItem value)? forecastItem,
    required TResult orElse(),
  }) {
    if (forecastItem != null) {
      return forecastItem(this);
    }
    return orElse();
  }
}

abstract class ForecastItem implements ForecastListItem {
  const factory ForecastItem(
      {required String time,
      required Color background,
      required String airQuality,
      required Component component}) = _$ForecastItem;

  String get time => throw _privateConstructorUsedError;
  Color get background => throw _privateConstructorUsedError;
  String get airQuality => throw _privateConstructorUsedError;
  Component get component => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForecastItemCopyWith<ForecastItem> get copyWith =>
      throw _privateConstructorUsedError;
}
