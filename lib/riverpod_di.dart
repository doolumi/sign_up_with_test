import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign_up_with_test/validation_use_cases/email_validation_use_case.dart';
import 'package:sign_up_with_test/validation_use_cases/password_validation_use_case.dart';
import 'package:sign_up_with_test/validation_view_models/email_validation_view_model.dart';
import 'package:sign_up_with_test/validation_view_models/password_validation_view_model.dart';
import 'package:sign_up_with_test/validation_view_models/validation_state.dart';

// Use Cases

final emailValidationUseCaseProvider =
    Provider<EmailValidationUseCase>((ref) => EmailValidationUseCase());

final passwordValidationUseCaseProvider =
    Provider<PasswordValidationUseCase>((ref) => PasswordValidationUseCase());

// ViewModels

final emailValidationViewModelProvider =
    StateNotifierProvider<EmailValidationViewModel, ValidationState>(
        (ref) => EmailValidationViewModel(ref));

final passwordValidationViewModelProvider =
    StateNotifierProvider<PasswordValidationViewModel, ValidationState>(
        (ref) => PasswordValidationViewModel(ref));
