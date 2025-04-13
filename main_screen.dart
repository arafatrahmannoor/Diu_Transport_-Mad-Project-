import 'package:diu_transport/ui/screens/buses_screen.dart';
import 'package:diu_transport/ui/screens/contact_us_screen.dart';
import 'package:diu_transport/ui/screens/feedback_screen.dart';
import 'package:diu_transport/ui/screens/location_screen.dart';
import 'package:diu_transport/ui/screens/login_screen.dart';
import 'package:diu_transport/ui/screens/my_profile_screen.dart';
import 'package:diu_transport/ui/screens/notification_screen.dart';
import 'package:diu_transport/ui/screens/schedule_screen.dart';
import 'package:diu_transport/ui/screens/settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:diu_transport/shared.dart';

import '../widgets/diu_app_bar.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    selectedIndexNotifier.addListener(() {
      setState(() {
        _selectedIndex = selectedIndexNotifier.value;
      });
    });
  }

  List<String> navButtons = [
    'Home',
    'Schedule',
    'Location',
    'Buses',
    'Settings'
  ];
  List<Map<String, dynamic>> buttons = [
    {'icon': Icons.home, 'text': 'Home'},
    {'icon': Icons.person, 'text': 'Profile'},
    {'icon': Icons.settings, 'text': 'Settings'},
    {'icon': Icons.notifications, 'text': 'Notifications'},
    {'icon': Icons.help, 'text': 'Help'},
    {'icon': Icons.info, 'text': 'About'},
    {'icon': Icons.support_agent, 'text': 'Contact us'},
    {'icon': Icons.feedback, 'text': 'Feedback'},
    {'icon': Icons.share, 'text': 'Share'},
    {'icon': Icons.logout, 'text': 'Logout'},
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List _pages = [
    HomeScreen(),
    ScheduleScreen(),
    LocationScreen(),
    BusesScreen(),
    SettingsScreen(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SafeArea(
        child: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Center(
                    // Centers the content both vertically and horizontally
                    child: Column(
                      mainAxisSize: MainAxisSize
                          .min, // Shrinks column to its content height
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 34,
                          ),
                        ),
                        SizedBox(
                            height:
                                12), // Vertical spacing between avatar and text
                        Text(
                          'Person',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () =>
                            _onTapDrawerMenuButton(buttons[index]['text']),
                        leading: Icon(
                          buttons[index]['icon'],
                          size: 35,
                        ),
                        title: Text(
                          buttons[index]['text'],
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
      appBar: DiuAppBar(
        title: navButtons[_selectedIndex],
        onTapMenuIcon: _onTapMenuIcon,
        onTapNotificationIcon: _onTapNoticationIcon,
      ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          elevation: 0,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
              selectedIndexNotifier.value = index;
            });
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.timer_outlined), label: 'Schedule'),
            NavigationDestination(
                icon: Icon(Icons.location_on), label: 'Location'),
            NavigationDestination(
                icon: Icon(Icons.directions_bus), label: 'Buses'),
            NavigationDestination(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
      body: _pages[_selectedIndex],
    );
  }

  void _onTapNoticationIcon() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NotificationScreen()));
  }

  void _onTapMenuIcon() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _onTapDrawerMenuButton(String label) {
    Navigator.pop(context); // close drawer

    switch (label) {
      case 'Home':
        setState(() => _selectedIndex = 0);
        break;
      case 'Profile':
        setState(() => Navigator.push(context,
            MaterialPageRoute(builder: (context) => MyProfileScreen())));
        break;
      case 'Settings':
        setState(() => _selectedIndex = 4);
        break;
      case 'Notifications':
        setState(() => Navigator.push(context,
            MaterialPageRoute(builder: (context) => NotificationScreen())));
        break;
      case 'Help':
        setState(() => _selectedIndex = 0);
        break;
      case 'About':
        setState(() => _selectedIndex = 0);
        break;
      case 'Contact us':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ContactUsScreen()));
        break;
      case 'Feedback':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FeedbackScreen()));
        break;
      case 'Share':
        Share.share(
            'Check out this awesome app: https://github.com/jihanurrahman33');
        break;
      case 'Logout':
        logout();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (predicate) => false);
        break;

      default:
        break;
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
