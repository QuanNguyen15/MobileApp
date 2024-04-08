import 'package:ch4_starter_exercise/pages/addNewContact.dart';
import 'package:flutter/material.dart';
import 'package:ch4_starter_exercise/pages/addNewContact.dart';


class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const MyAppBar({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: Colors.blue[500],
      elevation: 0,
      leading: const IconButton(
        icon: Icon(Icons.menu),
        tooltip: 'Navigation menu',
        onPressed: null,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddNewContactScreen())
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: null,
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: null,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class PhoneBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Book',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFf0f0f0),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.black87, fontSize: 18),
          iconTheme: IconThemeData(color: Colors.black87),
        ),
      ),
      home: PhoneBookScreen(),
    );
  }
}
class PhoneBookScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'John Doe', phoneNumber: '1234567890', address: '123 Main St'),
    Contact(name: 'Jane Smith', phoneNumber: '0987654321', address: '456 Park Ave'),
    Contact(name: 'Jane Smith1', phoneNumber: '0987654321', address: '456 Park Ave'),
    Contact(name: 'Jane Smith2', phoneNumber: '0987654321', address: '456 Park Ave'),
    Contact(name: 'Jane Smith3', phoneNumber: '0987654321', address: '456 Park Ave'),
    Contact(name: 'Jane Smith4', phoneNumber: '0987654321', address: '456 Park Ave'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                contacts[index].name[0],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].phoneNumber),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactDetailScreen(contact: contacts[index])),
              );
            },
          );
        },
      ),
    );
  }
}





class Contact {
  final String name;
  final String phoneNumber;
  final String address;

  Contact({required this.name, required this.phoneNumber, required this.address});
}

class ContactDetailScreen extends StatelessWidget {
  final Contact contact;

  ContactDetailScreen({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  contact.name[0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 16),
              Text(contact.name),
              const SizedBox(height: 8),
              Text('Phone Number: ${contact.phoneNumber}'),
              const SizedBox(height: 8),
              Text('Address: ${contact.address}'),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.call, color: Colors.blue,),
                    onPressed: null,
                  ),
                  IconButton(
                    icon: Icon(Icons.message_rounded, color: Colors.blue,),
                    onPressed: null,
                  ),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
