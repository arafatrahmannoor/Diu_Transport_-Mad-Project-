import 'package:diu_transport/ui/screens/one_card_connect_screen.dart';
import 'package:flutter/material.dart';

class BusesScreen extends StatefulWidget {
  const BusesScreen({super.key});

  @override
  State<BusesScreen> createState() => _BusesScreenState();
}

class _BusesScreenState extends State<BusesScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double padding = screenSize.width * 0.03;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: GridView.builder(
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: screenSize.width < 600 ? 2 : 3,
              crossAxisSpacing: padding,
              mainAxisSpacing: padding,
              childAspectRatio: 0.68,
            ),
            itemBuilder: (context, index) {
              return LayoutBuilder(builder: (context, constraints) {
                final double innerFontSize = constraints.maxWidth * 0.08;
                final double chipFontSize = constraints.maxWidth * 0.07;
                final double buttonHeight = constraints.maxHeight * 0.12;

                return Container(
                  padding: EdgeInsets.all(constraints.maxWidth * 0.05),
                  decoration: BoxDecoration(
                    color: const Color(0xffbccfe0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text('DSC Campus',
                          style: TextStyle(
                              fontSize: innerFontSize, color: Colors.black)),
                      Text('<->',
                          style: TextStyle(
                              fontSize: innerFontSize, color: Colors.black)),
                      Text('Uttara',
                          style: TextStyle(
                              fontSize: innerFontSize, color: Colors.black)),
                      const Divider(color: Colors.black),
                      Text('Rajanigondha 11',
                          style: TextStyle(
                              fontSize: innerFontSize * 0.9,
                              color: Colors.black)),
                      const SizedBox(height: 6),
                      Text('Start time (To DSC):',
                          style: TextStyle(fontSize: chipFontSize)),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 4,
                        children: const [
                          Text('7:20 AM',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.green)),
                          Text('7:50 AM',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.green)),
                          Text('8:30 AM',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.green)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text('Departure time (From DSC):',
                          style: TextStyle(fontSize: chipFontSize)),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 4,
                        children: const [
                          Text('3:00 PM',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.green)),
                          Text('4:00 PM',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.green)),
                          Text('5:30 PM',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.green)),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: buttonHeight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: _onTapBuyTicket,
                          child: Text('Buy Ticket',
                              style: TextStyle(fontSize: chipFontSize)),
                        ),
                      )
                    ],
                  ),
                );
              });
            }),
      ),
    );
  }

  void _onTapBuyTicket() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OneCardConnectScreen()));
  }
}
