import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        leading: const BackButton(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            // Profile avatar and edit button
            Stack(
              alignment: Alignment.topRight,
              children: [
                Column(
                  children: const [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, size: 40, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text("User_Name",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    Text("example@diu.edu.bd",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.edit, size: 20),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),

            // Membership
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              width: double.infinity,
              color: Colors.grey.shade200,
              child: const Text('Transportation Membership',
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: const Text("Yes"),
                    value: true,
                    groupValue: false,
                    onChanged: (value) {},
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text("No"),
                    value: false,
                    groupValue: false,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Personal Info Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              color: Colors.grey.shade200,
              child: const Text("Personal Information",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),

            // Personal Info Fields
            _buildDisabledField("Name"),
            _buildDisabledField("Email"),
            _buildDisabledField("Mobile No."),
            _buildDisabledField("Address"),
            const SizedBox(height: 10),

            // Academic Info Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              color: Colors.grey.shade200,
              child: const Text("Academic Information",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),

            // Academic Info Fields
            _buildDisabledField("Student ID"),
            _buildDisabledField("Program"),
            _buildDisabledField("Department"),
            _buildDisabledField("Faculty"),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildDisabledField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }
}
