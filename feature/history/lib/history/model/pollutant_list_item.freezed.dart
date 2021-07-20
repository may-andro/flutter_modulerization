// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pollutant_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PollutantListItemTearOff {
  const _$PollutantListItemTearOff();

  HeaderItem headerItem(String label) {
    return HeaderItem(
      label,
    );
  }

  PollutantItem pollutantItem(
      String time, Color background, String airQuality, Component component) {
    return PollutantItem(
      time,
      background,
      airQuality,
      component,
    );
  }
}

/// @nodoc
const $PollutantListItem = _$PollutantListItemTearOff();

/// @nodoc
mixin _$PollutantListItem {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String label) headerItem,
    required TResult Function(String time, Color background, String airQuality,
            Component component)
        pollutantItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String label)? headerItem,
    TResult Function(String time, Color background, String airQuality,
            Component component)?
        pollutantItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HeaderItem value) headerItem,
    required TResult Function(PollutantItem value) pollutantItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeaderItem value)? headerItem,
    TResult Function(PollutantItem value)? pollutantItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollutantListItemCopyWith<$Res> {
  factory $PollutantListItemCopyWith(
          PollutantListItem value, $Res Function(PollutantListItem) then) =
      _$PollutantListItemCopyWithImpl<$Res>;
}

/// @nodoc
class _$PollutantListItemCopyWithImpl<$Res>
    implements $PollutantListItemCopyWith<$Res> {
  _$PollutantListItemCopyWithImpl(this._value, this._then);

  final PollutantListItem _value;
  // ignore: unused_field
  final $Res Function(PollutantListItem) _then;
}

/// @nodoc
abstract class $HeaderItemCopyWith<$Res> {
  factory $HeaderItemCopyWith(
          HeaderItem value, $Res Function(HeaderItem) then) =
      _$HeaderItemCopyWithImpl<$Res>;
  $Res call({String label});
}

/// @nodoc
class _$HeaderItemCopyWithImpl<$Res>
    extends _$PollutantListItemCopyWithImpl<$Res>
    implements $HeaderItemCopyWith<$Res> {
  _$HeaderItemCopyWithImpl(HeaderItem _value, $Res Function(HeaderItem) _then)
      : super(_value, (v) => _then(v as HeaderItem));

  @override
  HeaderItem get _value => super._value as HeaderItem;

  @override
  $Res call({
    Object? label = freezed,
  }) {
    return _then(HeaderItem(
      label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HeaderItem with DiagnosticableTreeMixin implements HeaderItem {
  const _$HeaderItem(this.label);

  @override
  final String label;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PollutantListItem.headerItem(label: $label)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PollutantListItem.headerItem'))
      ..add(DiagnosticsProperty('label', label));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HeaderItem &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(label);

  @JsonKey(ignore: true)
  @override
  $HeaderItemCopyWith<HeaderItem> get copyWith =>
      _$HeaderItemCopyWithImpl<HeaderItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String label) headerItem,
    required TResult Function(String time, Color background, String airQuality,
            Component component)
        pollutantItem,
  }) {
    return headerItem(label);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String label)? headerItem,
    TResult Function(String time, Color background, String airQuality,
            Component component)?
        pollutantItem,
    required TResult orElse(),
  }) {
    if (headerItem != null) {
      return headerItem(label);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HeaderItem value) headerItem,
    required TResult Function(PollutantItem value) pollutantItem,
  }) {
    return headerItem(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeaderItem value)? headerItem,
    TResult Function(PollutantItem value)? pollutantItem,
    required TResult orElse(),
  }) {
    if (headerItem != null) {
      return headerItem(this);
    }
    return orElse();
  }
}

abstract class HeaderItem implements PollutantListItem {
  const factory HeaderItem(String label) = _$HeaderItem;

  String get label => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeaderItemCopyWith<HeaderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollutantItemCopyWith<$Res> {
  factory $PollutantItemCopyWith(
          PollutantItem value, $Res Function(PollutantItem) then) =
      _$PollutantItemCopyWithImpl<$Res>;
  $Res call(
      {String time, Color background, String airQuality, Component component});
}

/// @nodoc
class _$PollutantItemCopyWithImpl<$Res>
    extends _$PollutantListItemCopyWithImpl<$Res>
    implements $PollutantItemCopyWith<$Res> {
  _$PollutantItemCopyWithImpl(
      PollutantItem _value, $Res Function(PollutantItem) _then)
      : super(_value, (v) => _then(v as PollutantItem));

  @override
  PollutantItem get _value => super._value as PollutantItem;

  @override
  $Res call({
    Object? time = freezed,
    Object? background = freezed,
    Object? airQuality = freezed,
    Object? component = freezed,
  }) {
    return _then(PollutantItem(
      time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      background == freezed
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as Color,
      airQuality == freezed
          ? _value.airQuality
          : airQuality // ignore: cast_nullable_to_non_nullable
              as String,
      component == freezed
          ? _value.component
          : component // ignore: cast_nullable_to_non_nullable
              as Component,
    ));
  }
}

/// @nodoc

class _$PollutantItem with DiagnosticableTreeMixin implements PollutantItem {
  const _$PollutantItem(
      this.time, this.background, this.airQuality, this.component);

  @override
  final String time;
  @override
  final Color background;
  @override
  final String airQuality;
  @override
  final Component component;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PollutantListItem.pollutantItem(time: $time, background: $background, airQuality: $airQuality, component: $component)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PollutantListItem.pollutantItem'))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('background', background))
      ..add(DiagnosticsProperty('airQuality', airQuality))
      ..add(DiagnosticsProperty('component', component));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PollutantItem &&
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
  $PollutantItemCopyWith<PollutantItem> get copyWith =>
      _$PollutantItemCopyWithImpl<PollutantItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String label) headerItem,
    required TResult Function(String time, Color background, String airQuality,
            Component component)
        pollutantItem,
  }) {
    return pollutantItem(time, background, airQuality, component);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String label)? headerItem,
    TResult Function(String time, Color background, String airQuality,
            Component component)?
        pollutantItem,
    required TResult orElse(),
  }) {
    if (pollutantItem != null) {
      return pollutantItem(time, background, airQuality, component);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HeaderItem value) headerItem,
    required TResult Function(PollutantItem value) pollutantItem,
  }) {
    return pollutantItem(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeaderItem value)? headerItem,
    TResult Function(PollutantItem value)? pollutantItem,
    required TResult orElse(),
  }) {
    if (pollutantItem != null) {
      return pollutantItem(this);
    }
    return orElse();
  }
}

abstract class PollutantItem implements PollutantListItem {
  const factory PollutantItem(String time, Color background, String airQuality,
      Component component) = _$PollutantItem;

  String get time => throw _privateConstructorUsedError;
  Color get background => throw _privateConstructorUsedError;
  String get airQuality => throw _privateConstructorUsedError;
  Component get component => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PollutantItemCopyWith<PollutantItem> get copyWith =>
      throw _privateConstructorUsedError;
}
