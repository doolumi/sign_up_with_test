import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign_up_with_test/riverpod_di.dart';
import 'package:sign_up_with_test/validation_view_models/i_validation_view_model.dart';

import 'validation_state.dart';

class EmailValidationViewModel extends IValidationViewModel {
  EmailValidationViewModel(this._ref);

  final Ref _ref;

  @override
  void validate() {
    Either result =
    _ref.read(emailValidationUseCaseProvider).call(textEditingController.text);
    result.fold((l) {
      state = ValidationState.error(l);
    }, (r) {
      state = ValidationState.valid(r);
    });
  }
}