import 'package:diu_transport/ui/screens/one_card_otp_screen.dart';
import 'package:flutter/material.dart';

class OneCardConnectScreen extends StatefulWidget {
  const OneCardConnectScreen({super.key});

  @override
  State<OneCardConnectScreen> createState() => _OneCardConnectScreenState();
}

class _OneCardConnectScreenState extends State<OneCardConnectScreen> {
  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.grey.shade400),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Connect 1Card',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/one_card.png',
                fit: BoxFit.cover, // Replace with your logo asset path
                height: 150,
              ),
              const SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.badge),
                  hintText: 'Enter Student ID',
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  border: inputBorder,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'Enter institutional Email',
                  border: inputBorder,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  prefixIcon: const Icon(Icons.lock),
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility_off),
                    onPressed: () {},
                  ),
                  border: inputBorder,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  prefixIcon: const Text('+880 ',
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  prefixIconConstraints:
                      const BoxConstraints(minWidth: 50, minHeight: 0),
                  hintText: 'Enter Phone No.',
                  border: inputBorder,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: _onTapContinue,
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapContinue() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OneCardOtpScreen()));
  }
}
