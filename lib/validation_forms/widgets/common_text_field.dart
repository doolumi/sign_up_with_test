import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({Key? key,
    required this.hintText,
    required this.inputType,
    required this.inputAction,
    required this.onChanged,
    required this.focusNode,
    this.readOnly = false,
    required this.onDone,
    required this.controller,
    required this.label})
      : super(key: key);

  final String label;
  final String hintText;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool readOnly;
  final FocusNode focusNode;
  final VoidCallback onDone;
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      onChanged: onChanged,
      cursorWidth: 1,
      readOnly: readOnly,
      focusNode: focusNode,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: inputType,
      onEditingComplete: onDone,
      textInputAction: inputAction,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}