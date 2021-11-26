abstract class ValidateFailure implements Exception {
  final String value;
  final String message;
  ValidateFailure({required this.value, required this.message});
}

class EmailValidationFailure implements ValidateFailure {
  @override
  final String value;
  @override
  final String message = '이메일을 올바르게 입력해 주세요.';

  EmailValidationFailure(this.value);
}


class Password1ValidationFailure implements ValidateFailure {
  @override
  final String value;
  @override
  final String message = '영문, 숫자 2가지 이상 조합(8~20자)';

  Password1ValidationFailure(this.value);
}

class Password2ValidationFailure implements ValidateFailure {
  @override
  final String value;
  @override
  final String message = '3개 이상 연속되거나 동일한 문자/숫자 제외';

  Password2ValidationFailure(this.value);
}

class NameValidationFailure implements ValidateFailure {
  @override
  final String value;
  @override
  final String message = '이름을 정확히 입력하세요.';

  NameValidationFailure(this.value);
}

class PhoneValidationFailure implements ValidateFailure {
  @override
  final String value;
  @override
  final String message = '휴대전화 번호를 정확히 입력하세요.';

  PhoneValidationFailure(this.value);
}