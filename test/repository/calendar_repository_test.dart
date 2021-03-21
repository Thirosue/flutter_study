import 'package:flutter_app/repository/calendar_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final repository = CalendarRepository();

  group('CalendarRepository current() ', () {
    test('当月のスケジュールが取得できること', () async {
      final results = await repository.current();
      expect(results.length, 40);

      results.forEach((schedule) {
        final now = DateTime.now();
        print(schedule.from);
        expect(schedule.from.year, now.year);
        expect(schedule.from.month, now.month);
      });
    });
  });
}
