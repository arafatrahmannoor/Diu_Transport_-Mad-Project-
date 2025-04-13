import 'package:diu_transport/ui/widgets/diu_app_bar.dart';
import 'package:flutter/material.dart';

class MyTicketsScreen extends StatefulWidget {
  const MyTicketsScreen({super.key});

  @override
  State<MyTicketsScreen> createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends State<MyTicketsScreen> {
  bool isMember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DiuAppBar(
          onTapMenuIcon: () {},
          title: 'My Tickets',
          onTapNotificationIcon: () {}),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back arrow and title

              const SizedBox(height: 16),

              // Membership toggle
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Transportation Membership',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const Icon(Icons.star, color: Colors.amber),
                    ],
                  ),
                  Row(
                    children: [
                      ToggleButtons(
                        isSelected: [isMember, !isMember],
                        borderRadius: BorderRadius.circular(8),
                        selectedColor: Colors.black,
                        fillColor: Colors.grey.shade300,
                        onPressed: (index) {
                          isMember = index == 0;
                        },
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text("Yes",
                                style: TextStyle(color: Colors.black)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text("No",
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Purchases section
              const Text(
                "Purchases",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),

              // Demo ticket
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Purchase Info',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'DSC To Mirpur-10\n',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Departure Time: ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          TextSpan(
                              text: '7:00 AM\n',
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                            text: 'TID: ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          TextSpan(
                              text: '01GHKAJ78KAJDGOWET23KL\n',
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                            text: 'Date: ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          TextSpan(
                              text: '12-04-2025',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Pass section
              const Text(
                "Pass Available",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Premium Pass
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "Premium Pass",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // One Time Pass
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "One Time Pass",
                      style: TextStyle(
                        color: Colors
                            .white, // keeping white to contrast background
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
