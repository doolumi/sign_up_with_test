import 'package:dartz/dartz.dart';
import 'package:sign_up_with_test/error.dart';

class EmailValidationUseCase {
  Either<EmailValidationFailure, String> call(String email) {
    if(email.length.isEven){
      return Right(email);
    }else{
      return Left(EmailValidationFailure(email));
    }
  }
}
