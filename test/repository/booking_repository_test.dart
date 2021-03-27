import 'package:flutter_app/model/calendar/booking.dart';
import 'package:flutter_app/repository/booking_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() async {
  final repository = BookingRepository();
  final booking = Booking(
    day: DateFormat('yyyyMMdd').format(DateTime.now()),
    time: DateTime.now().microsecondsSinceEpoch,
    at: '1000',
    cols: 4,
    dateText: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()),
    name: 'john doe',
    tel: 'dummy',
    request: 'dummy',
  );

  group('BookingRepository create() ', () {
    test('予約が正常に作成できること', () async {
      print(booking.toString());
      await repository.create(booking);
      assert(true);
    });
  });
}
