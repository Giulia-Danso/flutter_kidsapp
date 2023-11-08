import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'chatscreen.dart';

class ContactList extends StatelessWidget {
  ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace this with your contact list UI
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return ListTile(
          title: Text(contact.name),
          subtitle: Text(contact.phoneNumber),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.phone),
                onPressed: () {
                  _makeCall(contact.phoneNumber);
                },
              ),
              IconButton(
                icon: const Icon(Icons.message),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(contact: contact),
                    ),
                  );
                },
              ),
            ],
          ),
          onTap: () {
            _showContactOptions(context, contact);
          },
        );
      },
    );
  }

  void _showContactOptions(BuildContext context, Contact contact) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(contact.name),
            content: Text('Phone: ${contact.phoneNumber}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _makeCall(contact.phoneNumber);
                },
                child: const Text('Call'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _sendMessage(contact.phoneNumber);
                },
                child: const Text('Send Message'),
              ),
            ],
          );
        });
  }

  Future<void> _makeCall(String phoneNumber) async {
    if (await canLaunch('tel:$phoneNumber')) {
      await launch('tel:$phoneNumber');
    } else {
      print('Could not launch $phoneNumber');
    }
  }

  Future<void> _sendMessage(String phoneNumber) async {
    if (await canLaunch('sms:$phoneNumber')) {
      await launch('sms:$phoneNumber');
    } else {
      print('Could not launch SMS to $phoneNumber');
    }
  }
}

class Contact {
  final String name;
  final String phoneNumber;
  Contact(this.name, this.phoneNumber);
}

final List<Contact> contacts = [
  Contact('Christabel', '+4915211351863'),
  Contact('Whitney', '+49123456789'),
  Contact('Giulia', '+9876543121'),
  Contact('Mamma', '+490012345544'),
];
