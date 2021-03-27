// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Booking _$BookingFromJson(Map<String, dynamic> json) {
  return _Booking.fromJson(json);
}

/// @nodoc
class _$BookingTearOff {
  const _$BookingTearOff();

  _Booking call(
      {required String day,
      required int time,
      required String at,
      required int cols,
      required String dateText,
      required String name,
      String? tel,
      String? request}) {
    return _Booking(
      day: day,
      time: time,
      at: at,
      cols: cols,
      dateText: dateText,
      name: name,
      tel: tel,
      request: request,
    );
  }

  Booking fromJson(Map<String, Object> json) {
    return Booking.fromJson(json);
  }
}

/// @nodoc
const $Booking = _$BookingTearOff();

/// @nodoc
mixin _$Booking {
  String get day => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;
  String get at => throw _privateConstructorUsedError;
  int get cols => throw _privateConstructorUsedError;
  String get dateText => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get tel => throw _privateConstructorUsedError;
  String? get request => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingCopyWith<Booking> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingCopyWith<$Res> {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) then) =
      _$BookingCopyWithImpl<$Res>;
  $Res call(
      {String day,
      int time,
      String at,
      int cols,
      String dateText,
      String name,
      String? tel,
      String? request});
}

/// @nodoc
class _$BookingCopyWithImpl<$Res> implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._value, this._then);

  final Booking _value;
  // ignore: unused_field
  final $Res Function(Booking) _then;

  @override
  $Res call({
    Object? day = freezed,
    Object? time = freezed,
    Object? at = freezed,
    Object? cols = freezed,
    Object? dateText = freezed,
    Object? name = freezed,
    Object? tel = freezed,
    Object? request = freezed,
  }) {
    return _then(_value.copyWith(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      at: at == freezed
          ? _value.at
          : at // ignore: cast_nullable_to_non_nullable
              as String,
      cols: cols == freezed
          ? _value.cols
          : cols // ignore: cast_nullable_to_non_nullable
              as int,
      dateText: dateText == freezed
          ? _value.dateText
          : dateText // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tel: tel == freezed
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String?,
      request: request == freezed
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$BookingCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$BookingCopyWith(_Booking value, $Res Function(_Booking) then) =
      __$BookingCopyWithImpl<$Res>;
  @override
  $Res call(
      {String day,
      int time,
      String at,
      int cols,
      String dateText,
      String name,
      String? tel,
      String? request});
}

/// @nodoc
class __$BookingCopyWithImpl<$Res> extends _$BookingCopyWithImpl<$Res>
    implements _$BookingCopyWith<$Res> {
  __$BookingCopyWithImpl(_Booking _value, $Res Function(_Booking) _then)
      : super(_value, (v) => _then(v as _Booking));

  @override
  _Booking get _value => super._value as _Booking;

  @override
  $Res call({
    Object? day = freezed,
    Object? time = freezed,
    Object? at = freezed,
    Object? cols = freezed,
    Object? dateText = freezed,
    Object? name = freezed,
    Object? tel = freezed,
    Object? request = freezed,
  }) {
    return _then(_Booking(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      at: at == freezed
          ? _value.at
          : at // ignore: cast_nullable_to_non_nullable
              as String,
      cols: cols == freezed
          ? _value.cols
          : cols // ignore: cast_nullable_to_non_nullable
              as int,
      dateText: dateText == freezed
          ? _value.dateText
          : dateText // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tel: tel == freezed
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String?,
      request: request == freezed
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Booking implements _Booking {
  const _$_Booking(
      {required this.day,
      required this.time,
      required this.at,
      required this.cols,
      required this.dateText,
      required this.name,
      this.tel,
      this.request});

  factory _$_Booking.fromJson(Map<String, dynamic> json) =>
      _$_$_BookingFromJson(json);

  @override
  final String day;
  @override
  final int time;
  @override
  final String at;
  @override
  final int cols;
  @override
  final String dateText;
  @override
  final String name;
  @override
  final String? tel;
  @override
  final String? request;

  @override
  String toString() {
    return 'Booking(day: $day, time: $time, at: $at, cols: $cols, dateText: $dateText, name: $name, tel: $tel, request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Booking &&
            (identical(other.day, day) ||
                const DeepCollectionEquality().equals(other.day, day)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.at, at) ||
                const DeepCollectionEquality().equals(other.at, at)) &&
            (identical(other.cols, cols) ||
                const DeepCollectionEquality().equals(other.cols, cols)) &&
            (identical(other.dateText, dateText) ||
                const DeepCollectionEquality()
                    .equals(other.dateText, dateText)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.tel, tel) ||
                const DeepCollectionEquality().equals(other.tel, tel)) &&
            (identical(other.request, request) ||
                const DeepCollectionEquality().equals(other.request, request)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(day) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(at) ^
      const DeepCollectionEquality().hash(cols) ^
      const DeepCollectionEquality().hash(dateText) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(tel) ^
      const DeepCollectionEquality().hash(request);

  @JsonKey(ignore: true)
  @override
  _$BookingCopyWith<_Booking> get copyWith =>
      __$BookingCopyWithImpl<_Booking>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BookingToJson(this);
  }
}

abstract class _Booking implements Booking {
  const factory _Booking(
      {required String day,
      required int time,
      required String at,
      required int cols,
      required String dateText,
      required String name,
      String? tel,
      String? request}) = _$_Booking;

  factory _Booking.fromJson(Map<String, dynamic> json) = _$_Booking.fromJson;

  @override
  String get day => throw _privateConstructorUsedError;
  @override
  int get time => throw _privateConstructorUsedError;
  @override
  String get at => throw _privateConstructorUsedError;
  @override
  int get cols => throw _privateConstructorUsedError;
  @override
  String get dateText => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get tel => throw _privateConstructorUsedError;
  @override
  String? get request => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BookingCopyWith<_Booking> get copyWith =>
      throw _privateConstructorUsedError;
}
