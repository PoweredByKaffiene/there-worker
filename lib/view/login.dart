import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/auth_controller.dart';
import '../widgets/layout/root.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthenticationController _authController = Get.find<AuthenticationController>();


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    
    String? email;
    String? password;

    void attemptLogin() {
      _authController.login(email, password).then((wasSuccessful) {
        if (wasSuccessful) {
          Get.offAllNamed('/connect');
        }
      });
    }

    void onSubmit () {
      if (_formKey.currentState!.validate() != true) {
        return;
      }

      _formKey.currentState!.save();

      attemptLogin();
    }

    return Root(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            Text("Login", style: theme.textTheme.headline1?.copyWith(color: theme.primaryColor, fontWeight: FontWeight.bold), textAlign: TextAlign.start),
            SizedBox(height: 1.h),
            Text("Login to start sharing your location", style: theme.textTheme.subtitle1, textAlign: TextAlign.start),
            const Divider(),
            SizedBox(height: 6.h),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => GetUtils.isEmail(value!) ? null : "Enter valid email",
                    onSaved: (newValue) => email = newValue,
                  ),
                  SizedBox(height: 1.h),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your password",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value!.length < 6 ? "Password must be at least 6 characters" : null,
                    onSaved: (newValue) => password = newValue,
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    width: 70.w,
                    height: 6.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        foregroundColor: colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: onSubmit,
                      child: const Text("Login"),
                    ),
                  ),
                ],
              )
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}