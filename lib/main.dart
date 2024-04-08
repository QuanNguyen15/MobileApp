// import 'package:flutter/material.dart';
// import 'package:ch4_starter_exercise/pages/home.dart';
//
// void main(){
//   //runApp(MyApp());
//   runApp(
//        const MaterialApp(
//         title: 'My app',
//         home: SafeArea(
//             child: Scaffold(
//               body: MyScaffold(),
//             ),
//         ),
//
//     debugShowCheckedModeBanner: false,
//   ));
// }
//
// class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
//   final Widget title;
//   const MyAppBar({required this.title, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56,
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(color: Colors.blue[500]),
//
//       child: Row(
//         children: [
//           const IconButton(
//             icon: Icon(Icons.menu),
//             tooltip: 'Navigation menu',
//             onPressed: null,
//           ),
//           Expanded(
//               child: title,
//           ),
//           const IconButton(
//               onPressed: null,
//               icon: Icon(Icons.add)
//           ),
//           const IconButton(
//             icon: Icon(Icons.search),
//             tooltip: 'Search',
//             onPressed: null,
//           ),
//           const IconButton(
//               onPressed: null,
//               icon: Icon(Icons.more_vert)
//           )
//         ],
//       ),
//     );
//     Container(
//
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
//
// class MyScaffold extends StatelessWidget {
//   static const descTextStyle = TextStyle(
//     color: Colors.blue,
//     fontFamily: 'Roboto',
//     letterSpacing: 0.5,
//     fontSize: 18,
//     height: 2,
//   );
//
//   const MyScaffold({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     final iconList = DefaultTextStyle.merge(
//       style: descTextStyle,
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end, // Di chuyển xuống cuối
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Column(
//                   children: [
//                     Icon(Icons.phone, color: Colors.blue[500]),
//                     Container(
//                       child: const Text('Phone'),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Icon(Icons.contact_emergency, color: Colors.blue[500]),
//                     Container(
//                       child: const Text('Contact'),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Icon(Icons.share, color: Colors.blue[500]),
//                     Container(
//                       child: const Text('Share'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//
//     final contact = DefaultTextStyle.merge(
//         style: descTextStyle,
//         child: Container(
//           padding: const EdgeInsets.all(20),
//
//         ),
//     );
//
//     return Scaffold(
//       appBar: const MyAppBar(
//         title: Text('Contact'),
//       ),
//       body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//           const Center(
//               // child: MyWidget2(false)
//           ),
//           // Expanded( // Sử dụng Expanded để giữ phần child Row ở dưới cùng
//           //   child: iconList,
//           // ),
//         ],
//         ),
//       );
//
//   }
// }
//
// class MyWidget extends StatelessWidget{
//   final bool loading;
//
//
//   MyWidget(this.loading);
//
//   @override
//   Widget build(BuildContext context) {
//     if(loading){
//       return const CircularProgressIndicator();
//     }else{
//       return const Text("Hello");
//     }
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
// }
//
// class MyWidget2 extends StatefulWidget{
//   final bool loading;
//
//   MyWidget2(this.loading);
//
//   @override
//   State<StatefulWidget> createState() {
//
//     return MyWidget2State();
//   }
// }
//
// class MyWidget2State extends State<MyWidget2>{
//
//   late bool _localLoading;
//
//   void initState(){
//     _localLoading = widget.loading;
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     if(_localLoading){
//       return const CircularProgressIndicator();
//     }
//     else
//     {
//       return FloatingActionButton(onPressed: onClickButton);
//     }
//
//
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
//   void onClickButton(){
//     setState(() {
//       _localLoading = true;
//     });
//
//   }
//
// }
//
//
//
//
