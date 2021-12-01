import 'package:dartz/dartz.dart';
import 'package:sign_up_with_test/error.dart';
import 'package:sign_up_with_test/validation_use_cases/validation_use_case.dart';

class PasswordValidationUseCase implements ValidationUseCase {
  @override
  Either<List<ValidateFailure>, String> call(String password) {
    List<ValidateFailure> failureList = [];

    Either<ValidateFailure, String> result1 = _password1Check(password);
    result1.fold((l) => failureList.add(l), (r) => null);

    Either<ValidateFailure, String> result2 = _password2Check(password);
    result2.fold((l) => failureList.add(l), (r) => null);

    if(failureList.isEmpty){
      return Right(password);
    } else {
      return Left(failureList);
    }
  }

  Either<ValidateFailure, String> _password1Check(String password) {
    RegExp regExp =
    RegExp(r'''^((?=.*\d{1})(?=.*[a-zA-Z]{1}))+[a-zA-Z0-9]{8,20}$''');
    if (regExp.hasMatch(password)) {
      return Right(password);
    } else {
      return Left(Password1ValidationFailure(password));
    }
  }

  Either<ValidateFailure, String> _password2Check(String password) {
    if (_continuousWords(password)) {
      return Right(password);
    } else {
      return Left(Password2ValidationFailure(password));
    }
  }

  bool _continuousWords(String password) {
    var nowAscii = 0;
    var backupAscii = 0;
    var differ = 0;
    var backupDiffer = 0;
    var count = 0;
    var limit = 3;

    for (var i = 0; i < password.length; i++) {
      nowAscii = password.codeUnitAt(i);
      if (i > 0 &&
          (differ = backupAscii - nowAscii) > -2 &&
          (count = (differ == backupDiffer) ? count + 1 : 0) > limit - 3) {
        return false;
      }
      backupDiffer = differ;
      backupAscii = nowAscii;
    }
    return true;
  }
}