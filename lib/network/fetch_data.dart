// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// Future<Album> fetchAlbum() async {
//   final response = await http.get(
//     Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
//   );
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
//
// Future<Album> createAlbum(String title) async {
//   final response = await http.post(
//     Uri.parse('https://jsonplaceholder.typicode.com/albums'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'title': title,
//     }),
//   );
//
//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create album.');
//   }
// }
//
// Future<Album> updateAlbum(String title) async {
//   final response = await http.put(
//     Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'title': title,
//     }),
//   );
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to update album.');
//   }
// }
//
// Future<Album> deleteAlbum(String id) async {
//   final http.Response response = await http.delete(
//     Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//   );
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON. After deleting,
//     // you'll get an empty JSON `{}` response.
//     // Don't return `null`, otherwise `snapshot.hasData`
//     // will always return false on `FutureBuilder`.
//     return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     // If the server did not return a "200 OK response",
//     // then throw an exception.
//     throw Exception('Failed to delete album.');
//   }
// }
//
//
// class Album {
//   final int id;
//   final String title;
//
//   const Album({required this.id, required this.title});
//
//   factory Album.fromJson(Map<String, dynamic> json) {
//     return switch (json) {
//       {
//       'id': int id,
//       'title': String title,
//       } =>
//           Album(
//             id: id,
//             title: title,
//           ),
//       _ => throw const FormatException('Failed to load album.'),
//     };
//   }
// }
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() {
//     return _MyAppState();
//   }
// }
//
// // class _MyAppState extends State<MyApp> {
// //   final TextEditingController _controller = TextEditingController();
// //   Future<Album>? _futureAlbum;
// //   bool _showInputField = true; // Track whether to show input field or not
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Create Data Example',
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //       ),
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Create Data Example'),
// //         ),
// //         body: Container(
// //           alignment: Alignment.center,
// //           padding: const EdgeInsets.all(8),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: <Widget>[
// //               if (_showInputField) // Show input field if _showInputField is true
// //                 Padding(
// //                   padding: const EdgeInsets.all(8),
// //                   child: TextField(
// //                     controller: _controller,
// //                     decoration: const InputDecoration(hintText: 'Enter Title'),
// //                   ),
// //                 ),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   setState(() {
// //                     _futureAlbum = createAlbum(_controller.text);
// //                     _showInputField = false; // Hide input field after creating data
// //                   });
// //                 },
// //                 child: const Text('Create Data'),
// //               ),
// //               if (!_showInputField) // Show update button and displayed data if _showInputField is false
// //                 Column(
// //                   children: [
// //                     ElevatedButton(
// //                       onPressed: (){
// //                         setState(() {
// //                           _showInputField = true; // Show input field when updating data
// //                         });
// //                       },
// //                       child: const Text('Update Data'),
// //                     ),
// //                     SizedBox(height: 20), // Add space between buttons and displayed text
// //                     FutureBuilder<Album>(
// //                       future: _futureAlbum,
// //                       builder: (context, snapshot) {
// //                         if (snapshot.connectionState == ConnectionState.waiting) {
// //                           return CircularProgressIndicator();
// //                         } else if (snapshot.hasData) {
// //                           return GestureDetector(
// //                             onTap: () {
// //                               _controller.text = snapshot.data!.title;
// //                             },
// //                             child: Text(
// //                               snapshot.data!.title,
// //                               style: TextStyle(
// //                                 fontSize: 20,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                           );
// //                         } else if (snapshot.hasError) {
// //                           return Text('${snapshot.error}');
// //                         }
// //                         return Container(); // Return an empty container by default
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// // class _MyAppState extends State<MyApp> {
// //   final TextEditingController _controller = TextEditingController();
// //   Future<Album>? _futureAlbum;
// //   bool _showInputField = true; // Track whether to show input field or not
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Create Data Example',
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //       ),
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Create Data Example'),
// //         ),
// //         body: Container(
// //           alignment: Alignment.center,
// //           padding: const EdgeInsets.all(8),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: <Widget>[
// //               if (_showInputField) // Show input field if _showInputField is true
// //                 Padding(
// //                   padding: const EdgeInsets.all(8),
// //                   child: TextField(
// //                     controller: _controller,
// //                     decoration: const InputDecoration(hintText: 'Enter Title'),
// //                   ),
// //                 ),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   setState(() {
// //                     if (_showInputField) {
// //                       _futureAlbum = createAlbum(_controller.text);
// //                       _showInputField = false; // Hide input field after creating data
// //                     } else {
// //                       _controller.clear(); // Clear input field for new data
// //                       _showInputField = true; // Show input field for new data
// //                     }
// //                   });
// //                 },
// //                 child: Text(_showInputField ? 'Create Data' : 'Create Data'), // Change button text based on _showInputField
// //               ),
// //               if (!_showInputField) // Show update button and displayed data if _showInputField is false
// //                 Column(
// //                   children: [
// //                     ElevatedButton(
// //                       onPressed: (){
// //                         setState(() {
// //                           _showInputField = true; // Show input field when updating data
// //                         });
// //                       },
// //                       child: const Text('Update Data'),
// //                     ),
// //                     SizedBox(height: 20), // Add space between buttons and displayed text
// //                     FutureBuilder<Album>(
// //                       future: _futureAlbum,
// //                       builder: (context, snapshot) {
// //                         if (snapshot.connectionState == ConnectionState.waiting) {
// //                           return CircularProgressIndicator();
// //                         } else if (snapshot.hasData) {
// //                           return GestureDetector(
// //                             onTap: () {
// //                               _controller.text = snapshot.data!.title;
// //                             },
// //                             child: Text(
// //                               snapshot.data!.title,
// //                               style: TextStyle(
// //                                 fontSize: 20,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                           );
// //                         } else if (snapshot.hasError) {
// //                           return Text('${snapshot.error}');
// //                         }
// //                         return Container(); // Return an empty container by default
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //               Text(snapshot.data?.title ?? 'Deleted'),
// //               ElevatedButton(
// //                 child: const Text('Delete Data'),
// //                 onPressed: (){
// //                   setState(() {
// //                     if (snapshot.data != null) {
// //                       _futureAlbum = deleteAlbum(snapshot.data!.id.toString());
// //                     }
// //                   });
// //                 },
// //               )
// //
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// class _MyAppState extends State<MyApp> {
//   final TextEditingController _controller = TextEditingController();
//   Future<Album>? _futureAlbum;
//   bool _showInputField = true; // Track whether to show input field or not
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Create Data Example',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Create Data Example'),
//         ),
//         body: Container(
//           alignment: Alignment.center,
//           padding: const EdgeInsets.all(8),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               if (_showInputField) // Show input field if _showInputField is true
//                 Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: TextField(
//                     controller: _controller,
//                     decoration: const InputDecoration(hintText: 'Enter Title'),
//                   ),
//                 ),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     if (_showInputField) {
//                       _futureAlbum = createAlbum(_controller.text);
//                       _showInputField = false; // Hide input field after creating data
//                     } else {
//                       _controller.clear(); // Clear input field for new data
//                       _showInputField = true; // Show input field for new data
//                     }
//                   });
//                 },
//                 child: Text(_showInputField ? 'Create Data' : 'Create Data'), // Change button text based on _showInputField
//               ),
//               if (!_showInputField && _futureAlbum != null) // Show update button and displayed data if _showInputField is false and _futureAlbum is not null
//                 Column(
//                   children: [
//                     ElevatedButton(
//                       onPressed: (){
//                         setState(() {
//                           _showInputField = true; // Show input field when updating data
//                         });
//                       },
//                       child: const Text('Update Data'),
//                     ),
//                     SizedBox(height: 20), // Add space between buttons and displayed text
//                     FutureBuilder<Album>(
//                       future: _futureAlbum,
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState == ConnectionState.waiting) {
//                           return CircularProgressIndicator();
//                         } else if (snapshot.hasData) {
//                           return GestureDetector(
//                             onTap: () {
//                               _controller.text = snapshot.data!.title;
//                             },
//                             child: Text(
//                               snapshot.data!.title,
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           );
//                         } else if (snapshot.hasError) {
//                           return Text('${snapshot.error}');
//                         }
//                         return Container(); // Return an empty container by default
//                       },
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       child: const Text('Delete Data'),
//                       onPressed: (){
//                         setState(() {
//                           if (_futureAlbum != null) {
//                             _futureAlbum = deleteAlbum(_futureAlbum!.id.toString());
//                           }
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
