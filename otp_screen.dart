import 'dart:async';

import 'package:diu_transport/ui/screens/recovery_password_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';



class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() =>
      _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;
  final formKey = GlobalKey<FormState>();
  bool hasError = false;
  String currentText = "";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back arrow
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 20),

              // Title
              Text(
                "Check your email",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              // Subtitle
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black54),
                  children: [
                    TextSpan(text: "We sent a reset link to "),
                    TextSpan(
                      text: "contact@dscode...com\n",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: "Enter 5 digit code that mentioned in the email",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // OTP Input
              Form(
                key: formKey,
                child: PinCodeTextField(
                  keyboardType: TextInputType.number,
                  appContext: context,
                  length: 5,
                  animationType: AnimationType.fade,
                  cursorColor: Colors.black,
                  animationDuration: Duration(milliseconds: 300),
                  textStyle: TextStyle(fontSize: 20, color: Colors.black),
                  errorAnimationController: errorController,
                  controller: _otpController,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(6),
                    fieldHeight: 60,
                    fieldWidth: 50,
                    activeColor: Colors.green,
                    inactiveColor: Colors.grey.shade300,
                    selectedColor: Colors.green.shade700,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                  ),
                  backgroundColor: Colors.white,
                  enableActiveFill: true,
                  onChanged: (value) {
                    setState(() {
                      currentText = value;
                    });
                  },
                ),
              ),

              SizedBox(height: 24),

              // Verify button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    if (currentText.length != 5) {
                      errorController.add(ErrorAnimationType.shake);
                      setState(() => hasError = true);
                    } else {
                      // Verification success
                      setState(() => hasError = false);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Verified!"),
                      ));
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SetNewPasswordScreen()));
                    }
                  },
                  child: Text(
                    "Verify Code",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Resend text
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black54),
                    children: [
                      TextSpan(text: "Haven’t got the email yet? "),
                      TextSpan(
                        text: "Resend Code",
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Resend logic
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Resending..."),
                            ));
                          },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
