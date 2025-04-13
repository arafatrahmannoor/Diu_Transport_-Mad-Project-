import 'package:diu_transport/ui/screens/my_tickets_screen.dart';
import 'package:diu_transport/ui/widgets/custom_container.dart';
import 'package:flutter/material.dart';

import '../utils/app_string.dart';
import 'package:diu_transport/shared.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.04;
    final double verticalSpacing = screenSize.height * 0.02;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: verticalSpacing),
                Text(
                  AppString.serviceNeedText,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: screenSize.width * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                SizedBox(height: verticalSpacing * 0.8),

                /// Responsive row with wrap fallback
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    InkWell(
                      onTap: _onTapBusInfo,
                      child: CustomContainer(
                        containerText: 'Bus Information',
                        icon: Icons.directions_bus,
                      ),
                    ),
                    InkWell(
                      onTap: _onTapMyBookings,
                      child: CustomContainer(
                        containerText: 'My Bookings',
                        icon: Icons.note_outlined,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: verticalSpacing),

                /// Card list section
                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: verticalSpacing),
                      color: const Color(0xffEFEFEF),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'You Have any ongoing Order',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.black),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Need a Service today?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black,
                                    fontSize: screenSize.width * 0.045,
                                  ),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: SizedBox(
                                width: screenSize.width * 0.5,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {},
                                  child: Text('Check Bookings'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapBusInfo() {
    selectedIndexNotifier.value = 3;
  }

  void _onTapMyBookings() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyTicketsScreen()));
  }
}
