import 'package:dartz/dartz.dart';
import 'package:sign_up_with_test/error.dart';

class Password1ValidationUseCase {
  Either<Password1ValidationFailure, String> call(String password) {
    if(password.length.isEven){
      return Right(password);
    }else{
      return Left(Password1ValidationFailure(password));
    }
  }
}
