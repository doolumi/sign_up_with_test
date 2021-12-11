import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sign_up_with_test/sign_up_screen.dart';

import 'test_utility.dart';

void main() {
  group("이메일 유효성 검사 위젯 테스트", () {
    testWidgets('이메일 유효성 검사 초기 화면 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignUpScreen(),
        ),
      ));

      var emailTextField = find.widgetWithText(TextFormField, "이메일을 입력하세요.");
      expect(emailTextField, findsOneWidget);
      expect(find.text("이메일을 올바르게 입력해 주세요."), findsNothing);
    });

    testWidgets('이메일 유효성 검사 동작 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignUpScreen(),
        ),
      ));

      var emailTextField = find.widgetWithText(TextFormField, "이메일을 입력하세요.");
      await tester.enterText(emailTextField, 'hi');
      await tester.pumpAndSettle();
      expect(find.text("이메일을 올바르게 입력해 주세요."), findsOneWidget);
      await tester.enterText(emailTextField, 'jpoh281@gmail.com');
      await tester.pumpAndSettle();
      expect(find.text("이메일을 올바르게 입력해 주세요."), findsNothing);
    });
  });

  group("비밀번호 유효성 검사 위젯 테스트", () {
    testWidgets('비밀번호 유효성 검사 초기 화면 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignUpScreen(),
        ),
      ));

      var passwordTextField = find.widgetWithText(
          TextFormField, "비밀번호를 입력하세요.");
      expect(passwordTextField, findsOneWidget);

      expect(find.text('영문, 숫자 2가지 이상 조합(8~20자)'), findsNothing);
      expect(find.text('3개 이상 연속되거나 동일한 문자/숫자 제외'), findsNothing);
    });

    testWidgets('비밀번호 지우기 버튼 동작 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignUpScreen(),
        ),
      ));

      var passwordTextField = find.widgetWithText(
          TextFormField, "비밀번호를 입력하세요.");

      expect(getOpacity(tester, find.text("비밀번호를 입력하세요.")), 1.0);
      expect(find.byIcon(Icons.close), findsNothing);
      await tester.enterText(passwordTextField, 'hi');
      await tester.pumpAndSettle();

      expect(getOpacity(tester, find.text("비밀번호를 입력하세요.")), 0.0);
      expect(find.byIcon(Icons.close), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(getOpacity(tester, find.text("비밀번호를 입력하세요.")), 1.0);
      expect(find.byIcon(Icons.close), findsNothing);
    });

    testWidgets('비밀번호 유효성 검사 동작 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignUpScreen(),
        ),
      ));

      var passwordTextField = find.widgetWithText(
          TextFormField, "비밀번호를 입력하세요.");

      expect(getOpacity(tester, find.text("비밀번호를 입력하세요.")), 1.0);
      expect(find.byIcon(Icons.close), findsNothing);
      await tester.enterText(passwordTextField, 'hi');
      await tester.pumpAndSettle();

      expect(find.text('영문, 숫자 2가지 이상 조합(8~20자)'), findsOneWidget);
      expect(find.text('3개 이상 연속되거나 동일한 문자/숫자 제외'), findsNothing);


      await tester.enterText(passwordTextField, 'asdqw123');
      await tester.pumpAndSettle();

      expect(find.text('영문, 숫자 2가지 이상 조합(8~20자)'), findsNothing);
      expect(find.text('3개 이상 연속되거나 동일한 문자/숫자 제외'), findsOneWidget);

      await tester.enterText(passwordTextField, 'qqq');
      await tester.pumpAndSettle();

      expect(find.text('영문, 숫자 2가지 이상 조합(8~20자)'), findsOneWidget);
      expect(find.text('3개 이상 연속되거나 동일한 문자/숫자 제외'), findsOneWidget);

      await tester.enterText(passwordTextField, 'honor146');
      await tester.pumpAndSettle();

      expect(find.text('영문, 숫자 2가지 이상 조합(8~20자)'), findsNothing);
      expect(find.text('3개 이상 연속되거나 동일한 문자/숫자 제외'), findsNothing);
    });
  });
}
