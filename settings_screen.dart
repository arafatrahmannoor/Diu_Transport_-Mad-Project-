import 'package:diu_transport/ui/screens/my_profile_screen.dart';
import 'package:diu_transport/ui/screens/notification_screen.dart';
import 'package:diu_transport/ui/screens/one_card_connect_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          // --- User Profile Section ---
          InkWell(
            onTap: _onTapProfile,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              color: Colors.white,
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 30, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('User_Name',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const Text('example@diu.edu.bd',
                            style: TextStyle(color: Colors.grey)),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              SizedBox(width: 4),
                              Text('Membership  •  N/A',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          const SizedBox(height: 8),

          // --- Notifications ---
          ListTile(
            leading: const Icon(Icons.notifications_none),
            title: Text(
              'Notifications',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            tileColor: Colors.white,
            onTap: _onTapNotificationButton,
          ),

          const SizedBox(height: 8),

          // --- ACCOUNT SECTION HEADER ---
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('ACCOUNT', style: TextStyle(color: Colors.grey)),
          ),

          // --- Profile ---
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
              'Profile',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            tileColor: Colors.white,
            onTap: _onTapProfileButton,
          ),

          const Divider(height: 1),

          // --- Digital Payment ---
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text(
              'Digital Payment',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            tileColor: Colors.white,
            onTap: _onTapDigitalPaymentButton,
          ),

          const SizedBox(height: 8),

          // --- SETTINGS SECTION HEADER ---
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('SETTINGS', style: TextStyle(color: Colors.grey)),
          ),

          // --- Language ---
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text(
              'Language',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            trailing: const Icon(Icons.expand_more),
            tileColor: Colors.white,
            onTap: () {},
          ),

          const Divider(height: 1),

          // --- Permissions ---
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text(
              'Permissions',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            tileColor: Colors.white,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void _onTapProfile() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyProfileScreen()));
  }

  void _onTapDigitalPaymentButton() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OneCardConnectScreen()));
  }

  void _onTapProfileButton() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyProfileScreen()));
  }

  void _onTapNotificationButton() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NotificationScreen()));
  }
}
