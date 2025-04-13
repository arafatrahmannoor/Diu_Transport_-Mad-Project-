import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:diu_transport/ui/widgets/custom_text_form_field.dart';
import '../utils/app_string.dart';
import 'main_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool registrationinprogress = false;
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _studentIdController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.05;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 20),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppString.registerScreenButtonText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontSize: size.width * 0.07,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 24),

                // Name
                CustomTextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter a valid Username';
                    }
                    return null;
                  },
                  controller: _userNameController,
                  hintTextStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  prefixIcon: const Icon(Icons.person_2_outlined),
                  hintText: AppString.textFormFieldText1,
                ),
                const SizedBox(height: 16),

                // Email
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
                  controller: _emailController,
                  hintTextStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: AppString.textFormFieldText2,
                ),
                const SizedBox(height: 16),

                // Student ID
                CustomTextFormField( validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter a valid Student Id';
                  }
                  return null;
                },
                  controller: _studentIdController,
                  hintTextStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  prefixIcon: const Icon(Icons.badge_outlined),
                  hintText: AppString.textFormFieldText3,
                ),
                const SizedBox(height: 16),

                // Password
                CustomTextFormField(
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter a valid Password';
                    }
                    return null;
                  },
                  controller: _passwordController,
                  hintTextStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                  hintText: AppString.textFormFieldText4,
                ),
                const SizedBox(height: 16),

                // Confirm Password
                CustomTextFormField(
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter a valid Password';
                    }
                    return null;
                  },
                  controller: _confirmPasswordController,
                  hintTextStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                  hintText: AppString.textFormFieldText5,
                ),
                const SizedBox(height: 24),

                // Register Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _onTapRegister,
                    child: Visibility(
                      visible: registrationinprogress == false,
                      replacement: CircularProgressIndicator(),
                      child: Text(
                        AppString.registerButtonText,
                        style: TextStyle(fontSize: size.width * 0.045),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Already have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppString.alreadyHaveAnAccountText,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                    ),
                    TextButton(
                      onPressed: _onTapLogin,
                      child: Text(AppString.loginText),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapLogin() {
    Navigator.pop(context);
  }

  void _onTapRegister() async {
    if(_formKey.currentState!.validate()){
      final auth = FirebaseAuth.instance;

      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill in all fields')),
        );
        return;
      }

      try {
        registrationinprogress = true;
        setState(() {});
        await auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
        registrationinprogress = false;
        setState(() {});

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration successful!')),
        );

        // Navigate to MainScreen or LoginScreen after registration
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      } on FirebaseAuthException catch (e) {
        String message = 'Registration failed';
        if (e.code == 'email-already-in-use') {
          message = 'This email is already in use.';
        } else if (e.code == 'weak-password') {
          message = 'Password should be at least 6 characters.';
        }

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Something went wrong: $e')),
        );
      }
    }

  }
}
