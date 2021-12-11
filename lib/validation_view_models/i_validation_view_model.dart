import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'validation_state.dart';

abstract class IValidationViewModel extends StateNotifier<ValidationState> {
  IValidationViewModel() : super(const ValidationState.empty());

  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool readOnly = false;

  void onDone() {
    if (state is Valid) {
      focusNode.nextFocus();
    }
  }

  String? submit() {
    validate();
    if (state is Valid && focusNode.hasFocus) {
      focusNode.unfocus();
    }
    return state.whenOrNull(valid: (String s) => s);
  }

  validate();

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}