import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign_up_with_test/error.dart';
import 'package:sign_up_with_test/riverpod_di.dart';

class PasswordValidationView extends ConsumerWidget {
  const PasswordValidationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("비밀번호", style: TextStyle(color: Colors.black)),
        const SizedBox(height: 8),
        TextFormField(
          style: const TextStyle(color: Colors.black),
          cursorWidth: 1,
          obscureText: true,
          obscuringCharacter: '●',
          controller: ref
              .read(passwordValidationViewModelProvider.notifier)
              .textEditingController,
          focusNode:
              ref.read(passwordValidationViewModelProvider.notifier).focusNode,
          onChanged: (String? value) =>
              ref.read(passwordValidationViewModelProvider.notifier).validate(),
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.visiblePassword,
          onEditingComplete:
              ref.read(passwordValidationViewModelProvider.notifier).onDone,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: '비밀번호를 입력하세요.',
            suffixIcon: Visibility(
                visible: ref.watch(passwordValidationViewModelProvider).when(
                    empty: () => false,
                    error: (List<ValidateFailure> e) => e[0].value.isNotEmpty,
                    valid: (s) => s.isNotEmpty),
                child: GestureDetector(
                    onTap: ref
                        .read(passwordValidationViewModelProvider.notifier)
                        .clearText,
                    child: const Icon(Icons.close))),
          ),
        ),
        ref.watch(passwordValidationViewModelProvider).maybeWhen(
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
