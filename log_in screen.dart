
import 'package:diu_transport/ui/screens/main_screen.dart';
import 'package:diu_transport/ui/screens/password_forgot_screen.dart';
import 'package:diu_transport/ui/screens/register_screen.dart';
import 'package:diu_transport/ui/utils/app_string.dart';
import 'package:diu_transport/ui/utils/assets_path.dart';
import 'package:diu_transport/ui/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  TextEditingController _emailTEController = TextEditingController();
  TextEditingController _passwordTEController = TextEditingController();
  bool loginInProgress = false;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.08;
    final double logoHeight = screenSize.height * 0.2;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenSize.height * 0.05),
                  SizedBox(
                    height: logoHeight,
                    child: Image.asset(AssetsPath.logoPath),
                  ),
                  SizedBox(height: 10),
                  Text(
                    AppString.appName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: screenSize.height * 0.04),
                  Column(
                    children: [
                      CustomTextFormField(
                        validator: (String? value) {
                          bool isValidEmail(String email) {
                            final emailRegex = RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                            return emailRegex.hasMatch(email);
                          }

                          if (value == null || value.trim().isEmpty) {
                            return 'Email is required';
                          } else if (!isValidEmail(value.trim())) {
                            return 'Enter a valid email';
                          }

                          return null; // valid email
                        },
                        prefixIcon: Icon(Icons.badge_outlined),
                        hintText: AppString.loginFieldHintText1,
                        hintTextStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        controller: _emailTEController,
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      CustomTextFormField(
                        validator: (String? value){
                          if (value?.isEmpty ?? true) {
                            return 'Enter a valid Password';
                          }
                          return null;
                        },
                        isObsecure: true,
                        hintTextStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        hintText: AppString.loginFieldHintText2,
                        controller: _passwordTEController,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: _onTapForgotPassword,
                          child: Text(AppString.forgotPasswordText),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(fontSize: 18),
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: _onTapLogin,
                      child: Visibility(
                          visible: loginInProgress == false,
                          replacement: CircularProgressIndicator(),
                          child: Text(AppString.loginText)),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppString.dontHaveAnAccountText,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                      ),
                      TextButton(
                        onPressed: _onTapRegister,
                        child: Text(
                          AppString.registerButtonText,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapLogin() async {
    if  (_formKey.currentState!.validate()){
      final auth = FirebaseAuth.instance;

      loginInProgress = true;
      setState(() {});

      try {
        await auth.signInWithEmailAndPassword(
          email: _emailTEController.text.trim(),
          password: _passwordTEController.text,
        );

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      } on FirebaseAuthException catch (e) {
        String errorMsg = 'Login failed. Please try again.';
        if (e.code == 'user-not-found') {
          errorMsg = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          errorMsg = 'Wrong password provided.';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMsg)),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Something went wrong: $e')),
        );
      } finally {
        loginInProgress = false;
        setState(() {});
      }
    }

  }

  void _onTapRegister() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }

  void _onTapForgotPassword() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PasswordForgotScreen()),
    );
  }
}
