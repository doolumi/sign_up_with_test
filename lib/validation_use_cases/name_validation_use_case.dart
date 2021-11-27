import 'package:dartz/dartz.dart';
import 'package:sign_up_with_test/error.dart';
import 'package:sign_up_with_test/validation_use_cases/validation_use_case.dart';

class NameValidationUseCase implements ValidationUseCase {
  @override
  Either<ValidateFailure, String> call(String name) {
    RegExp regExp = RegExp(r'^[가-힣]{2}');
    if (regExp.hasMatch(name)) {
      return Right(name);
    } else {
      return Left(NameValidationFailure(name));
    }
  }
}
