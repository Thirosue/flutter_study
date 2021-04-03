import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/ui/component/atoms/custom_text_form_field.dart';
import 'package:provider/provider.dart';

import '../../utils/editable_text_utils.dart';

/// /////////////////////////
/// Widget for test
/// /////////////////////////
class TestModel extends ChangeNotifier {
  String title = '';
}

class TestApp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              CustomTextFormField(
                titleText: 'title',
                hintText: 'hintText',
                value: 'initValue',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'error';
                  }
                  return null;
                },
                onSaved: (value) => context.read<TestModel>().title = value!,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
                child: const Text('Submit'),
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
  group('CustomTextFormField ', () {
    testWidgets('タイトルラベルを設定したとき、タイトルラベルが画面に表示されること', (tester) async {
      // given
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: CustomTextFormField(
              titleText: 'titleText',
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
            child: CustomTextFormField(
              hintText: 'hintText',
            ),
          ),
        ),
      );

      //then
      expect(find.text('hintText'), findsOneWidget);
    });

    testWidgets('初期値を設定したとき、初期値が画面に表示されること', (tester) async {
      // given
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: CustomTextFormField(
              value: 'initValue',
            ),
          ),
        ),
      );

      //then
      expect(find.text('initValue'), findsOneWidget);
      final String editText = findRenderEditable(tester, 0).text!.text!;
      expect(editText, 'initValue');
    });

    testWidgets('必須チェックを設定し、エラー文言が画面に表示されないこと', (tester) async {
      // given
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: CustomTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'error';
                }
                return null;
              },
            ),
          ),
        ),
      );

      //then
      expect(find.text('error'), findsNothing);
    });

    testWidgets('複数のパラメータを渡したとき、各々のパラメータが画面に表示されること', (tester) async {
      // given
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: CustomTextFormField(
              titleText: 'titleText',
              hintText: 'hintText',
              value: 'initValue',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'error';
                }
                return null;
              },
              maxLines: 1,
              onSaved: (value) {},
            ),
          ),
        ),
      );

      //then
      expect(find.text('titleText'), findsOneWidget);
      expect(find.text('hintText'), findsOneWidget);
      expect(find.text('initValue'), findsOneWidget);
      expect(find.text('error'), findsNothing);
      final String editText = findRenderEditable(tester, 0).text!.text!;
      expect(editText, 'initValue');
    });

    testWidgets('テキストフィールドに文字を入力したとき、入力した文字が表示されるが、保存はされていないこと',
        (tester) async {
      // given
      final model = TestModel();
      final text = find.byType(TextFormField).at(0);
      final submit = find.text('Submit');
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (context) => model,
            child: TestApp(),
          ),
        ),
      );

      //when
      await tester.enterText(find.byType(TextFormField).at(0), 'hoge');
      await tester.pump();

      //then
      final String editTextInit = findRenderEditable(tester, 0).text!.text!;
      expect(editTextInit, 'hoge');
      expect(model.title.isEmpty, true);
    });

    testWidgets('テキストフィールドに文字を入力し保存ボタンを押したとき、入力した文字が保存されていること', (tester) async {
      // given
      final model = TestModel();
      final text = find.byType(TextFormField).at(0);
      final submit = find.text('Submit');
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (context) => model,
            child: TestApp(),
          ),
        ),
      );

      //when
      await tester.enterText(find.byType(TextFormField).at(0), 'hoge');
      await tester.tap(find.text('Submit'));
      await tester.pump();

      //then
      final String editTextThen = findRenderEditable(tester, 0).text!.text!;
      expect(editTextThen, 'hoge');
      expect(model.title, 'hoge');
    });
  });
}
