import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Contact Us',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      color: Color(0xffEEEEEE),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            contactInfo[index]['designation'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.green),
                          ),
                          Text(
                            contactInfo[index]['name'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                          ),
                          Text(
                            contactInfo[index]['position'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                          ),
                          Text(
                            contactInfo[index]['organization'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                          ),
                          Text(
                            contactInfo[index]['contact'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                          ),
                          Text(
                            contactInfo[index]['email'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  List<Map<String, dynamic>> contactInfo = [
    {
      "designation": "Operation Head",
      "name": "Mr. Kazi Md. Diljeb Kabir",
      "position": "Senior Assistant Registrar/Director",
      "organization": "Daffodil International University",
      "contact": "+8801713493104",
      "email": "diljeb@daffodilvarsity.edu.bd",
    },
    {
      "designation": "In-Charge Officer",
      "name": "Mr. Md. Ansur Rahman",
      "position": "Assistant Admin Officer",
      "organization": "Daffodil International University",
      "contact": "+8801847140037",
      "email": "anisur@daffodilvarsity.edu.bd",
    },
    {
      "designation": "Student Ticketing Officer",
      "name": "Mr. Md. Monir Ul Enam",
      "position": "Assistant Admin Officer",
      "organization": "Daffodil International University",
      "contact": "+8801847140029",
      "email": "monirulenam@daffodilvarsity.edu.bd",
    },
    {
      "designation": "Transport Supervisor",
      "name": "Mr. Md. Imran Hossain",
      "position": "Transport Supervisor",
      "organization": "Daffodil International University",
      "contact": "+8801713493083",
      "email": 'info', // Email not provided
    },
  ];
}
