
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sign_up_with_test/error.dart';

part 'validation_state.freezed.dart';

@freezed
class ValidationState with _$ValidationState {
  const factory ValidationState.empty() = ValidationEmpty;

  const factory ValidationState.error(
      List<ValidateFailure> exceptions) = ValidationError;

  const factory ValidationState.valid(String value) = Valid;
}