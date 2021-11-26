import 'package:dartz/dartz.dart';
import 'package:sign_up_with_test/error.dart';

class NameValidationUseCase {
  Either<NameValidationFailure, String> call(String name) {
    if(name.length.isEven){
      return Right(name);
    }else{
      return Left(NameValidationFailure(name));
    }
  }
}
