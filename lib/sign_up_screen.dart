import 'package:flutter/material.dart';
import 'package:sign_up_with_test/validation_forms/email_validation_form.dart';
import 'package:sign_up_with_test/validation_forms/password_validation_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("유효성 검사"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: const [
          EmailValidationView(),
          PasswordValidationView(),
        ],
      )),
    );
  }
}


