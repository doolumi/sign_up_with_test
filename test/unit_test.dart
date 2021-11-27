import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sign_up_with_test/error.dart';
import 'package:sign_up_with_test/validation_use_cases/email_validation_use_case.dart';
import 'package:sign_up_with_test/validation_use_cases/name_validation_use_case.dart';
import 'package:sign_up_with_test/validation_use_cases/password1_validation_use_case.dart';
import 'package:sign_up_with_test/validation_use_cases/password2_validation_use_case.dart';
import 'package:sign_up_with_test/validation_use_cases/phone_validation_use_case.dart';

void main() {
  group('E-mail Validation Check', () {
    test('@수 2개 이상: ERROR', () {
      Either<ValidateFailure, String> result =
          EmailValidationUseCase().call('hdd@@honor-driven.dev');
      expect(result.isLeft(), true);
    });

    test('.xxx 으로 끝나는 도메인 : PASS', () {
      Either<ValidateFailure, String> result =
          EmailValidationUseCase().call('hdd@honordriven.dev');
      expect(result.isRight(), true);
    });

    test('xxx.xxx 로 끝나는 도메인 : PASS', () {
      Either<ValidateFailure, String> result =
          EmailValidationUseCase().call('hdd@honor.driven.dev');
      expect(result.isRight(), true);
    });

    test('막 적은 문자 : ERROR', () {
      Either<ValidateFailure, String> result =
          EmailValidationUseCase().call('qwerasdfzxc');
      expect(result.isLeft(), true);
    });
  });

  group('Password 조건 1.영문, 숫자, 특수문자 2가지 이상 8~20자', () {
    test('8자 미만 : ERROR', () {
      Either<ValidateFailure, String> result =
          Password1ValidationUseCase().call('123asd');
      expect(result.isLeft(), true);
    });
    test('8자 & 혼합 조건 충족: PASS', () {
      Either<ValidateFailure, String> result =
          Password1ValidationUseCase().call('1234asdf');
      expect(result.isRight(), true);
    });
    test('20자 초과 : ERROR', () {
      Either<ValidateFailure, String> result = Password1ValidationUseCase()
          .call('asfkjwfhqwjhfqjwfhqkjwfhkqwjfqwjfhqk');
      expect(result.isLeft(), true);
    });

    test('20자 & 혼합 조건 충족 : PASS', () {
      Either<ValidateFailure, String> result =
          Password1ValidationUseCase().call('1234qwer123123qwe12q');
      expect(result.isRight(), true);
    });

    test('혼합 조건 미충족 + 글자수 조건 충족 : ERROR', () {
      Either<ValidateFailure, String> result =
          Password1ValidationUseCase().call('11112222');
      expect(result.isLeft(), true);
    });
  });

  group('Password 조건 2. 반복 되거나 동일한 숫자/문자', () {
    test('동일 숫자 : ERROR', () {
      Either<ValidateFailure, String> result =
          Password2ValidationUseCase().call('333');
      expect(result.isLeft(), true);
    });
    test('동일 문자 : ERROR', () {
      Either<ValidateFailure, String> result =
          Password2ValidationUseCase().call('qqq');
      expect(result.isLeft(), true);
    });
    test('연속 숫자 : ERROR', () {
      Either<ValidateFailure, String> result =
          Password2ValidationUseCase().call('123');
      expect(result.isLeft(), true);
    });
    test('떨어진 숫자 : Pass', () {
      Either<ValidateFailure, String> result =
          Password2ValidationUseCase().call('135');
      expect(result.isRight(), true);
    });
    test('연속 문자 : ERROR', () {
      Either<ValidateFailure, String> result =
          Password2ValidationUseCase().call('abc');
      expect(result.isLeft(), true);
    });
    test('떨어진 문자 : ERROR', () {
      Either<ValidateFailure, String> result =
          Password2ValidationUseCase().call('ace');
      expect(result.isRight(), true);
    });
  });

  group('이름 체크', () {
    test('한글자 이하 : ERROR', () {
      Either<ValidateFailure, String> result =
          NameValidationUseCase().call('김');
      expect(result.isLeft(), true);
    });
    test('숫자 영어 포함된 경우 : ERROR', () {
      Either<ValidateFailure, String> result =
          NameValidationUseCase().call('김13a');
      expect(result.isLeft(), true);
    });
    test('모음만 있는 경우 : ERROR', () {
      Either<ValidateFailure, String> result =
          NameValidationUseCase().call('ㅏㅏ');
      expect(result.isLeft(), true);
    });
    test('자음만 있는 경우 : ERROR', () {
      Either<ValidateFailure, String> result =
          NameValidationUseCase().call('ㅉ');
      expect(result.isLeft(), true);
    });
  });

  group('휴대전화', () {
    test('앞의 고유번호 ex(010) + 7~8글자 : PASS', () {
      Either<ValidateFailure, String> result =
          PhoneValidationUseCase().call('01012345678');
      expect(result.isRight(), true);
    });
    test('그냥 10 ~ 11자리 체크 : ERROR', () {
      Either<ValidateFailure, String> result =
          PhoneValidationUseCase().call('1234567890');
      expect(result.isLeft(), true);
    });
    test('11자 초과 : ERROR', () {
      Either<ValidateFailure, String> result =
          PhoneValidationUseCase().call('123456789012345');
      expect(result.isLeft(), true);
    });
    test('10자 미만 : ERROR', () {
      Either<ValidateFailure, String> result =
          PhoneValidationUseCase().call('123456789');
      expect(result.isLeft(), true);
    });
  });
}
