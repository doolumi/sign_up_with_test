import 'package:dartz/dartz.dart';
import 'package:sign_up_with_test/error.dart';

class Password2ValidationUseCase {
  Either<Password2ValidationFailure, String> call(String password) {
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
