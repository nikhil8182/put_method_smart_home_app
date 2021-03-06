//
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => MyAppState();
// }
//
// class MyAppState extends State<MyApp> {
//   // final url =
//   //     'https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&tagged=flutter&site=stackoverflow';
//
//   final url = "http://192.168.1.18/";
//   final controller = StreamController<List<StackOverflowInfo>>();
//
//   @override
//   void initState() {
//     super.initState();
//     Timer.periodic(
//         const Duration(seconds: 1),
//             (Timer t) =>  refreshQuestions());
//     //refreshQuestions();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // TODO: (not all material) pull into above widget.
//         title: 'StackOverflow Viewer',
//         theme: ThemeData(
//           primarySwatch: Colors.orange,
//         ),
//         home: Scaffold(
//             body: Container(
//               color: const Color(0xffc0c0c0),
//               child: Column(children: [
//                 CustomAppBar('SMART HOME SPP'),
//                 StackOverflowContent(controller.stream),
//                 PlatformButton(
//                     child: const Text('Refresh'),
//                     icon: const Icon(Icons.refresh),
//                     onPressed: refreshQuestions)
//               ]),
//             )));
//   }
//
//   void refreshQuestions() async {
//     var result = await http.get(Uri.parse(url));
//     setState(() {
//       var decoded = json.decode(result.body);
//       print(decoded);
//       // List items = decoded["Room"];
//       controller.add(decoded
//           .map<StackOverflowInfo>((item) => StackOverflowInfo.fromJson(item))
//           .toList());
//     });
//     //where((item) => !item['is_answered'])
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     controller.close();
//   }
// }
//
// class CustomAppBar extends StatelessWidget {
//   final String title;
//   CustomAppBar(this.title);
//
//   @override
//   Widget build(BuildContext context) {
//     final double statusBarHeight = MediaQuery.of(context).padding.top;
//
//     return Container(
//       padding: EdgeInsets.only(top: statusBarHeight),
//       height: statusBarHeight * 4,
//       child: Center(
//         child: Text(
//           title,
//           style: const TextStyle(
//               color: Colors.white, fontFamily: 'Kranky', fontSize: 36.0),
//         ),
//       ),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Colors.deepOrange,
//             Colors.orangeAccent,
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class StackOverflowInfo {
//   String title;
//   int id;
//   bool status = false;
//   StackOverflowInfo.fromJson(Map json) {
//     title = json['Device_Name'];
//     id = json["id"];
//     status = json["Device_Status"];
//   }
// }
//
// class StackOverflowContent extends StatefulWidget {
//   final Stream<List<StackOverflowInfo>> questionStream;
//
//
//   StackOverflowContent(this.questionStream);
//
//   @override
//   State<StackOverflowContent> createState() => _StackOverflowContentState();
// }
//
// class _StackOverflowContentState extends State<StackOverflowContent> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: widget.questionStream,
//         builder: (BuildContext context,
//             AsyncSnapshot<List<StackOverflowInfo>> snapshot) {
//           if (snapshot.hasError)
//             return Text('Error ${snapshot.error}');
//           else if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Text('Receiving questions...');
//           }
//           return Expanded(
//               child: ListView(
//                   children: snapshot.data
//                       .map<Widget>((info) => GestureDetector(
//                     onTap: (){
//                       setState(() {
//                         print("info of button ${info.title}");
//                         print("info of button ${info.status}");
//                         http.put(
//                           Uri.parse('http://192.168.1.18/${info.id}/'),
//                           headers: <String, String>{
//                             'Content-Type': 'application/json; charset=UTF-8',
//                           },
//                           body: jsonEncode(<String, bool>{
//                             'Device_Status': !info.status,
//                           }),
//                         );
//                         print("info of button ${info.status}");
//                       });
//
//                     },
//                     child: Card(
//                       child: ListTile(
//                           tileColor: info.status ? Colors.green: Colors.white,
//                           title: Text(info.title),
//                           leading: const CircleAvatar(
//                             child: Text("1"),
//                           )),
//                     ),
//                   ))
//                       .toList()));
//         });
//   }
// }
//
// class PlatformButton extends StatelessWidget {
//   PlatformButton({Key key, this.child, this.icon, this.onPressed})
//       : super(key: key);
//   final Widget child;
//   final Widget icon;
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     if (Theme.of(context).platform == TargetPlatform.iOS) {
//       return CupertinoButton(
//         child: child,
//         onPressed: onPressed,
//       );
//     } else {
//       return FloatingActionButton(
//         child: icon,
//         onPressed: onPressed,
//       );
//     }
//   }
//}