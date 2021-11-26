import 'package:dartz/dartz.dart';
import 'package:sign_up_with_test/error.dart';

class PhoneValidationUseCase {
  Either<PhoneValidationFailure, String> call(String phone) {
    if(phone.length.isEven){
      return Right(phone);
    }else{
      return Left(PhoneValidationFailure(phone));
    }
  }
}
