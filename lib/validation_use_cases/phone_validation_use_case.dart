import 'package:dartz/dartz.dart';
import 'package:sign_up_with_test/error.dart';

class PhoneValidationUseCase {
  Either<PhoneValidationFailure, String> call(String phone) {
    RegExp regExp = RegExp('^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})');
    if(regExp.hasMatch(phone)){
      return Right(phone);
    }else{
      return Left(PhoneValidationFailure(phone));
    }
  }
}
