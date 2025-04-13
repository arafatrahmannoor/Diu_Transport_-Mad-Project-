import 'package:diu_transport/ui/screens/main_screen.dart';
import 'package:flutter/material.dart';

class OneCardConnectedScreen extends StatefulWidget {
  const OneCardConnectedScreen({super.key});

  @override
  State<OneCardConnectedScreen> createState() => _OneCardConnectedScreenState();
}

class _OneCardConnectedScreenState extends State<OneCardConnectedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset('assets/images/tick_mark.png'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Successfully Connected',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white),
                onPressed: _onTapback,
                child: Text('Back to home'))
          ],
        ),
      ),
    );
  }

  void _onTapback() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
        (predicate) => false);
  }
}
