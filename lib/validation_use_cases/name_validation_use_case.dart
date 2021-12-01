import 'package:dartz/dartz.dart';
import 'package:sign_up_with_test/error.dart';
import 'package:sign_up_with_test/validation_use_cases/validation_use_case.dart';

class NameValidationUseCase implements ValidationUseCase {
  @override
  Either<List<ValidateFailure>, String> call(String name) {
    RegExp regExp = RegExp(r'^[가-힣]{2}');
    List<ValidateFailure> failureList = [];
    if (regExp.hasMatch(name)) {
      return Right(name);
    } else {
      failureList.add(NameValidationFailure(name));
      return Left(failureList);
    }
  }
}
