import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double padding = screenSize.width * 0.04;
    final double cardHeight = screenSize.height * 0.45;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.builder(
          itemCount: 4,
          padding: EdgeInsets.all(padding),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: padding),
              padding: EdgeInsets.all(padding),
              height: cardHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffbccfe0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Top Row - Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(child: Text('R${index + 1}')),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Dhanmondi <> DSC (Regular)',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Icon(Icons.navigation),
                    ],
                  ),

                  SizedBox(height: padding),

                  /// Start Time
                  Text(
                    "Start time (To DSC)",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: const [
                      Chip(label: Text('07:20 AM')),
                      Chip(label: Text('08:00 AM')),
                      Chip(label: Text('09:30 AM')),
                    ],
                  ),

                  SizedBox(height: padding),

                  /// Departure Time
                  Text(
                    "Departure time (From DSC)",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: const [
                      Chip(label: Text('02:00 PM')),
                      Chip(label: Text('03:30 PM')),
                      Chip(label: Text('05:00 PM')),
                    ],
                  ),

                  SizedBox(height: padding * 0.8),

                  /// Route Details
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        'Dhanmondi <> Sohanbag <> Shyamoli Square <> Technical Mor <> Majar Road Gabtoli <> Konabari Bus Stop <> Eastern Housing <> Rupnagar <> Birulia Bus Stand <> Daffodil Smart City',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
