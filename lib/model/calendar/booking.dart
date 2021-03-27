import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking.freezed.dart';

part 'booking.g.dart';

@freezed
abstract class Booking with _$Booking {
  const factory Booking({
    required String day,
    required int time,
    required String at,
    required int cols,
    required String dateText,
    required String name,
    String? tel,
    String? request,
  }) = _Booking;

  // static List<Booking> toList(List<dynamic> json) =>
  //     json.map((value) => Booking.fromJson(value)).toList();

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
}
