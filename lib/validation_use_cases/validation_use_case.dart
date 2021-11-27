import 'package:dartz/dartz.dart';
import 'package:sign_up_with_test/error.dart';

abstract class ValidationUseCase {
  Either<ValidateFailure, String> call(String aString);
}
