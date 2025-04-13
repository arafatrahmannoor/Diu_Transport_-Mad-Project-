import 'package:diu_transport/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Feedback',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name',style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
            CustomTextFormField(hintText: 'name'),
            SizedBox(height: 20,),
            Text('Email',style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
            CustomTextFormField(hintText: 'email'),
            SizedBox(height: 20,),
            Text('Subject',style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
            CustomTextFormField(hintText: 'subject'),
            SizedBox(height: 20,),
            Text('Message',style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                hintText: 'Enter your message here...'
              ),
            ),
            SizedBox(height: 30,),

            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor
                        ,foregroundColor: Colors.white,

                  ),
                  onPressed: (){}, child: Text('Submit',style: TextStyle(fontSize: 30),)),
            )

          ],
        ),
      ),
    );
  }
}
