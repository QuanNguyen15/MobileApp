import 'package:flutter/material.dart';
import 'package:ch4_starter_exercise/pages/phoneContact.dart'; // Assuming PhoneContact widget is defined in phone_contact.dart
import 'package:ch4_starter_exercise/pages/addNewContact.dart';
void main() {
  runApp(
    MaterialApp(
      home: PhoneBookApp(),
      debugShowCheckedModeBanner: false,
    )
  );
}
