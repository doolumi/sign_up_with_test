import 'package:dartz/dartz.dart';
import 'package:sign_up_with_test/error.dart';

class Password2ValidationUseCase {
  Either<Password2ValidationFailure, String> call(String password) {
    if(password.length.isEven){
      return Right(password);
    }else{
      return Left(Password2ValidationFailure(password));
    }
  }
}
