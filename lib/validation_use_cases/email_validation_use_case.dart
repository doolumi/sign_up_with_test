import 'package:dartz/dartz.dart';
import 'package:sign_up_with_test/error.dart';

class EmailValidationUseCase {
  Either<EmailValidationFailure, String> call(String email) {

    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if(regExp.hasMatch(email)){
      return Right(email);
    }else{
      return Left(EmailValidationFailure(email));
    }
  }
}