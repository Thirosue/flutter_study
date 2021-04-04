import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/ui/component/atoms/dropdown_form_field.dart';
import 'package:provider/provider.dart';

final empty = [];

final items3 = [
  {
    "display": "one",
    "value": "one",
  },
  {
    "display": "two",
    "value": "two",
  },
  {
    "display": "three",
    "value": "three",
  },
];

/// /////////////////////////
/// Widget for test
/// /////////////////////////
class TestModel extends ChangeNotifier {
  String value = '';
}

class TestApp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final model = context.read<TestModel>();

    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              DropDownFormField(
                titleText: 'DropDownFormField',
                value: 'three',
                items: items3,
                onChanged: (value) {
                  print('onChanged triggered');
                  model.value = value!;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// /////////////////////////
/// test
/// /////////////////////////

void main() {
  group('DropDownFormField ', () {
    testWidgets('タイトルラベルを設定したとき、タイトルラベルが画面に表示されること', (tester) async {
      // given
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: DropDownFormField(
              titleText: 'titleText',
              items: [],
              onChanged: (value) {},
            ),
          ),
        ),
      );

      //then
      expect(find.text('titleText'), findsOneWidget);
    });

    testWidgets('ヒント文を設定したとき、ヒント文が画面に表示されること', (tester) async {
      // given
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: DropDownFormField(
              hintText: 'hintText',
              items: [],
              onChanged: (value) {},
            ),
          ),
        ),
      );

      //then
      expect(find.text('hintText'), findsOneWidget);
    });

    testWidgets('選択肢を設定したとき、選択肢が設定されていること', (tester) async {
      // given
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: DropDownFormField(
              items: items3,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      //then
      expect(find.text('one'), findsOneWidget);
      expect(find.text('two'), findsOneWidget);
      expect(find.text('three'), findsOneWidget);
      expect(find.byType(DropdownMenuItem), findsNWidgets(3));
    });

    testWidgets('初期値を設定したとき、初期値が設定されていること', (tester) async {
      // given
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: DropDownFormField(
              value: 'two',
              items: items3,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      //then
      //TODO 選択肢が選択されていることの確認
    });

    testWidgets('必須チェックを設定したとき、エラー文言が画面に表示されていないこと', (tester) async {
      // given
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: DropDownFormField(
              items: items3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'error';
                }
                return null;
              },
              onChanged: (value) {},
            ),
          ),
        ),
      );

      //then
      expect(find.text('error'), findsNothing);
    });

    testWidgets('ドロップダウンに初期値を設定したとき、初期値はモデルに反映されないこと', (tester) async {
      // given
      final model = TestModel();
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (context) => model,
            child: TestApp(),
          ),
        ),
      );

      //then
      expect(model.value.isEmpty, true);
    });

    testWidgets('ドロップダウンを選択したとき、モデルに選択した値が反映されること', (tester) async {
      // given
      final model = TestModel();
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (context) => model,
            child: TestApp(),
          ),
        ),
      );

      //when
      await tester.tap(find.text('two').first);
      await tester.tap(find.text('two').last);
      await tester.tap(find.byType(DropdownMenuItem).at(1));
      await tester.pump();

      //then
      //TODO onChangeが発火したことの確認
    });
  });
}
