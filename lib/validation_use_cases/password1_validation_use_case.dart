import 'package:dartz/dartz.dart';
import 'package:sign_up_with_test/error.dart';
import 'package:sign_up_with_test/validation_use_cases/validation_use_case.dart';

class Password1ValidationUseCase implements ValidationUseCase {
  @override
  Either<ValidateFailure, String> call(String password) {
    RegExp regExp =
        RegExp(r'''^((?=.*\d{1})(?=.*[a-zA-Z]{1}))+[a-zA-Z0-9]{8,20}$''');
    if (regExp.hasMatch(password)) {
      return Right(password);
    } else {
      return Left(Password1ValidationFailure(password));
    }
  }
}
