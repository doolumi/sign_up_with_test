import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sign_up_with_test/error.dart';
import 'package:sign_up_with_test/validation_use_cases/email_validation_use_case.dart';

void main() {
  group('E-mail Validation Check', () {
    test('@수 2개 이상: ERROR', () {
      Either<EmailValidationFailure, String> result = EmailValidationUseCase()
          .call('hdd@@honor-driven.dev');
      expect(result.isLeft(), true);
    });

    test('.xxx 으로 끝나는 도메인 : PASS', () {
      Either<EmailValidationFailure, String> result = EmailValidationUseCase()
          .call('hdd@honordriven.dev');
      expect(result.isRight(), true);
    });

    test('xxx.xxx 로 끝나는 도메인 : PASS', () {
      Either<EmailValidationFailure, String> result = EmailValidationUseCase()
          .call('hdd@honor.driven.dev');
      expect(result.isRight(), true);
    });

    test('막 적은 문자 : ERROR', () {
      Either<EmailValidationFailure, String> result = EmailValidationUseCase()
          .call('qwerasdfzxc');
      expect(result.isLeft(), true);
    });
  });
}