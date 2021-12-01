import 'package:dartz/dartz.dart';
import 'package:sign_up_with_test/error.dart';
import 'package:sign_up_with_test/validation_use_cases/validation_use_case.dart';

class EmailValidationUseCase implements ValidationUseCase {
  @override
  Either<List<ValidateFailure>, String> call(String email) {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    List<ValidateFailure> failureList = [];
    if (regExp.hasMatch(email)) {
      return Right(email);
    } else {
      failureList.add(EmailValidationFailure(email));
      return Left(failureList);
    }
  }
}
