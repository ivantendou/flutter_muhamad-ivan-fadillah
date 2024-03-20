import 'package:flutter/material.dart';

class ContactFormHeader extends StatelessWidget {
  const ContactFormHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        children: [
          Icon(
            Icons.person_add,
            size: 24.0,
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            'Create New Contacts',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Fill in the fields below to add a new contact. Ensure to provide the full name and a valid phone number before submitting.',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Divider(),
        ],
      ),
    );
  }
}
