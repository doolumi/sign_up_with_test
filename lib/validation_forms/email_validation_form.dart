import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign_up_with_test/error.dart';
import 'package:sign_up_with_test/riverpod_di.dart';
import 'package:sign_up_with_test/validation_forms/widgets/common_text_field.dart';

class EmailValidationView extends ConsumerWidget {
  const EmailValidationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("이메일", style: TextStyle(color: Colors.black),),
        const SizedBox(height:4),
        CommonTextField(
            label: "이메일",
            inputType: TextInputType.emailAddress,
            controller: ref
                .read(emailValidationViewModelProvider.notifier)
                .textEditingController,
            onChanged: (String? value) =>
                ref.read(emailValidationViewModelProvider.notifier).validate(),
            inputAction: TextInputAction.next,
            hintText: "이메일을 입력하세요.",
            focusNode:
            ref.read(emailValidationViewModelProvider.notifier).focusNode,
            onDone:
            ref.read(emailValidationViewModelProvider.notifier).onDone),
        ref.watch(emailValidationViewModelProvider).maybeWhen(
            error: (List<ValidateFailure> exceptions) => Column(
              children: [
                const SizedBox(height: 8),
                ...List.generate(
                    exceptions.length,
                        (index) => Text(exceptions[index].message,
                        style: const TextStyle(color: Colors.red))),
              ],
            ),
            orElse: () => Container()),
      ],
    );
  }
}