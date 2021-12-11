// import 'dart:async';
// import 'dart:convert';
// import 'package:vibration/vibration.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:http/http.dart' as http;
//
//
// class SecondPageForButtons extends StatefulWidget {
//  SecondPageForButtons(this.roomName);
//
//
//   final String roomName;
//   @override
//   _SecondPageForButtonsState createState() => _SecondPageForButtonsState();
// }
//
// bool a = true;
//
// List json = [];
// List lightList = [];
// List devices = [];
// List fan = [];
// var buttonType = 'light';
// Timer timer;
//
//
// class _SecondPageForButtonsState extends State<SecondPageForButtons> {
//
//
//   getData() async {
//     print("im inside the getData");
//     final response = await http.get(
//       Uri.parse('http://192.168.1.18/'),
//     );
//     final fanResponse = await http.get(
//       Uri.parse('http://192.168.1.18/fan'),
//     );
//     setState(() {
//       var deviceData = jsonDecode(response.body);
//       json = deviceData;
//       var fanData = jsonDecode(fanResponse.body);
//       devices.clear();
//       for(int i =0; i<json.length;i++){
//          if(widget.roomName == json[i]["Room"]){
//            devices.add(json[i]);
//            // devices.add("fanData[i]");
//          }}
//          for(int i =0; i<fanData.length;i++){
//            if(widget.roomName == fanData[i]["Fan_Name"]){
//              // devices.add(json[i]);
//              devices.add(fanData[i]);
//            }}
//       //print(devices);
//     });
//   }
//
//   updateValue(int id, bool status){
//     setState(() {
//       print("im inisde the update value id is $id , $status");
//       http.put(
//         Uri.parse('http://192.168.1.18/$id/'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, bool>{
//           'Device_Status': !status,
//         }),
//       );
//     });
//   }
//
//
//   @override
//   void initState() {
//     // json = getData();
//     //devices.clear();
//     // getData();
//     timer = Timer.periodic(
//         const Duration(seconds: 1),
//             (Timer t) =>  getData());
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       body: Container(
//         height: height * 1.0,
//         width: width * 1.0,
//         child: Column(
//           children: [
//             Stack(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                             begin: Alignment.bottomLeft,
//                             end: Alignment.topRight,
//                             colors: [
//                               // Color.fromRGBO(0, 0, 0, 1.0),
//                               // Color.fromRGBO(38, 42, 45, 1.0),
//                               Theme.of(context).primaryColor,
//                               Theme.of(context).scaffoldBackgroundColor
//                             ],
//                             stops: [
//                               0.1,
//                               0.9
//                             ])),
//                     child: Container(
//                       height: height * 0.35,
//                       width: width * 1.0,
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               colorFilter: ColorFilter.mode(
//                                   Colors.black.withOpacity(0.7),
//                                   BlendMode.dstATop),
//                               image: ((widget.roomName.toString().replaceAll("_", " ") == "Hall"))
//                                   ? AssetImage(
//                                 "images/room/hall.png",
//                               )
//                                   : ((widget.roomName.toString().replaceAll("_", " ") == "Admin Room"))
//                                   ? AssetImage(
//                                 "images/room/admin room.jpg",
//                               ) : ((widget.roomName.toString().replaceAll("_", " ") == "Garage"))
//                                   ? AssetImage(
//                                 "images/room/garage.png",
//                               )
//                                   : ((widget.roomName.toString().replaceAll("_", " ") == "Kitchen"))
//                                   ? AssetImage(
//                                 "images/room/kitchen.png",
//                               )
//                                   : ((widget.roomName.toString().replaceAll("_", " ") == "Bathroom1"))
//                                   ? AssetImage(
//                                 "images/room/bathroom 1.png",
//                               ): ((widget.roomName.toString().replaceAll("_", " ") == "Bathroom2"))
//                                   ? AssetImage(
//                                 "images/room/bathroom 2.png",
//                               )
//                                   : ((widget.roomName.toString().replaceAll("_", " ") == "Bedroom1"))
//                                   ? AssetImage(
//                                 "images/room/bedroom 1.png",
//                               )
//                                   : ((widget.roomName.toString().replaceAll("_", " ") == "Bedroom2"))
//                                   ? AssetImage(
//                                 "images/room/bedroom 2.png",
//                               )
//                                   : ((widget.roomName.toString().replaceAll("_", " ") ==  "Master Bedroom"))
//                                   ? AssetImage(
//                                 "images/room/master bedroom.png",
//                               )
//                                   : ((widget.roomName.toString().replaceAll("_", " ") ==  "Bedroom"))
//                                   ? AssetImage(
//                                 "images/room/bedroom 2.png",
//                               )
//                                   : ((widget.roomName.toString().replaceAll("_", " ") ==  "Kids Room"))
//                                   ? AssetImage(
//                                 "images/room/kids bedroom.png",
//                               )
//                                   : ((widget.roomName.toString().replaceAll("_", " ") ==  "Outside"))
//                                   ? AssetImage(
//                                 "images/room/outside.png",
//                               )
//                                   : ((widget.roomName.toString().replaceAll("_", " ") ==  "Garden"))
//                                   ? AssetImage(
//                                 "images/room/garden.png",
//                               )
//                                   : ((widget.roomName.toString().replaceAll("_", " ") ==  "Parking"))
//                                   ? AssetImage(
//                                 "images/room/parking.png",
//                               )
//                                   : ((widget.roomName.toString().replaceAll("_", " ") ==  "Living Room"))
//                                   ? AssetImage(
//                                 "images/room/living room.png",
//
//                               )
//                                   : ((widget.roomName.toString().replaceAll("_", " ") ==  "Store Room"))
//                                   ? AssetImage(
//                                 "images/room/store room.png",
//                               )
//                                   : AssetImage(""),
//                               fit: BoxFit.fill)
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: IconButton(
//                       onPressed: (){
//                         Navigator.pop(context);
//                       },
//                       icon: Icon(Icons.arrow_back,color: Colors.white,size: height*0.030,),
//                     ),
//                   )
//                 ]
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 10.0),
//               //height: height * 0.3724,
//               height: height * 0.65,
//               width: width * 1.0,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.bottomLeft,
//                     end: Alignment.topRight,
//                     colors: [
//                       Color.fromRGBO(0, 0, 0, 1.0),
//                       Color.fromRGBO(45, 47, 49, 1.0),
//                       // Theme.of(context).primaryColor,
//                       // Theme.of(context).scaffoldBackgroundColor
//
//                     ],
//                     stops: [
//                       0.1,
//                       0.7
//                     ]
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: height * 0.015,
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: Text(
//                         widget.roomName.toString().replaceAll("_", " "),
//                         style: const TextStyle(color: Colors.white),
//                       )),
//
//                   SizedBox(
//                     height: height * 0.010,
//                   ),
//
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 5.0),
//                     height: height * 0.5500,
//                     width: width * 1.0,
//                     color: Colors.transparent,
//                     child: SingleChildScrollView(
//                               child: Column(
//                                   children:  [
//                                     Wrap(
//                                     spacing: 2.0,
//                                     children:  devices.map((word){
//                                       return word['Device_Type']=='Light' ?
//                                       InkWell(
//                                           onTap: () {
//                                             // setState(() {
//                                             //   print(word["id"]);
//                                             //   print(word["Device_Status"]);
//                                             //   word["Device_Status"] = !word["Device_Status"];
//                                             //   // var sts = word["Device_Status"];
//                                             //   // sts = !sts;
//                                             //   // updateValue(word["id"], word["Device_Status"]);
//                                             //   http.put(
//                                             //     Uri.parse('http://192.168.1.18/${word["id"]}/'),
//                                             //     headers: <String, String>{
//                                             //       'Content-Type': 'application/json; charset=UTF-8',
//                                             //     },
//                                             //     body: jsonEncode(<String, bool>{
//                                             //       'Device_Status': word["Device_Status"],
//                                             //     }),
//                                             //   );
//                                             //
//                                             // });
//                                             print(word["id"]);
//                                             print(word["Device_Status"]);
//                                             word["Device_Status"] = !word["Device_Status"];
//                                             // var sts = word["Device_Status"];
//                                             // sts = !sts;
//                                             // updateValue(word["id"], word["Device_Status"]);
//                                             setState(() {
//                                               print("inisde the setstate");
//                                               http.put(
//                                                 Uri.parse('http://192.168.1.18/${word["id"]}/'),
//                                                 headers: <String, String>{
//                                                   'Content-Type': 'application/json; charset=UTF-8',
//                                                 },
//                                                 body: jsonEncode(<String, bool>{
//                                                   'Device_Status': word["Device_Status"],
//                                                 }),
//                                               );
//                                               print("after setstate");
//                                             });
//                                             // Vibration.vibrate(duration: 100,amplitude: 128);
//                                             print(word["Device_Status"]);
//                                           },
//                                           child: Container(
//                                             // height: MediaQuery.of(context).size.height * 0.12,
//                                             // width: MediaQuery.of(context).size.width * 0.265,
//                                               height: MediaQuery.of(context).size.height * 0.17,
//                                               width: MediaQuery.of(context).size.width * 0.37,
//
//                                               padding: const EdgeInsets.all(5),
//                                               margin: EdgeInsets.all(10),
//                                               decoration: BoxDecoration(
//                                                   color: word["Device_Status"] ?Colors.orange:Colors.grey,
//                                                   borderRadius: BorderRadius.circular(20),
//
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                         offset: Offset(0, 0),
//                                                         color: Colors.grey[700],
//                                                         blurRadius: 1,
//                                                         spreadRadius: 1),
//                                                     const BoxShadow(
//                                                         offset: Offset(1, 1),
//                                                         color: Colors.black87,
//                                                         blurRadius: 1,
//                                                         spreadRadius: 1)
//                                                   ]),
//                                               child: Column(
//                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                                 children: [
//                                                   Container(
//                                                     height: MediaQuery.of(context).size.height * 0.04,
//                                                     width: MediaQuery.of(context).size.width * 0.2,
//                                                     margin: const EdgeInsets.only(top: 10),
//                                                     child:
//                                                     SvgPicture.asset(
//                                                       "images/ac.svg",
//                                                       height: MediaQuery.of(context).size.height * 0.051,
//                                                     ),
//
//                                                   ),
//                                                   SizedBox(
//                                                     height: MediaQuery.of(context).size.height * 0.015,
//                                                   ),
//                                                   Container(
//                                                     child: Column(
//                                                       children: [
//
//                                                         Text(word['Device_Name'].toString(),style: const TextStyle(color: Colors.white),)
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ))):
//                                       word['Device_Type']=='Fan' ?
//                                       Text('Push',style: TextStyle(color: Colors.white)):
//                                       word['Device_Type']=='Switch' ?
//                                       Container(
//                                           child: InkWell(
//                                               onTap: () {
//                                                 http.put(
//                                                   Uri.parse('http://192.168.1.18/${word["id"]}/'),
//                                                   headers: <String, String>{
//                                                     'Content-Type': 'application/json; charset=UTF-8',
//                                                   },
//                                                   body: jsonEncode(<String, bool>{
//                                                     'Device_Status': !word["Device_Status"],
//                                                   }),
//                                                 );
//                                               },
//                                               child: Container(
//                                                 // height: MediaQuery.of(context).size.height * 0.12,
//                                                 // width: MediaQuery.of(context).size.width * 0.265,
//                                                   height: MediaQuery.of(context).size.height * 0.17,
//                                                   width: MediaQuery.of(context).size.width * 0.37,
//                                                   padding: const EdgeInsets.all(5),
//                                                   margin: EdgeInsets.all(10),
//                                                   decoration: BoxDecoration(
//                                                       color: word['Device_Status']?Colors.orange:Colors.grey,
//                                                       borderRadius: BorderRadius.circular(20),
//
//                                                       boxShadow: [
//                                                         BoxShadow(
//                                                             offset: Offset(0, 0),
//                                                             color: Colors.grey[700],
//                                                             blurRadius: 1,
//                                                             spreadRadius: 1),
//                                                         const BoxShadow(
//                                                             offset: Offset(1, 1),
//                                                             color: Colors.black87,
//                                                             blurRadius: 1,
//                                                             spreadRadius: 1)
//                                                       ]),
//                                                   child: Column(
//                                                     mainAxisAlignment: MainAxisAlignment.center,
//                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                     children: [
//                                                       Container(
//                                                         height: MediaQuery.of(context).size.height * 0.04,
//                                                         width: MediaQuery.of(context).size.width * 0.2,
//                                                         margin: const EdgeInsets.only(top: 10),
//                                                         child:
//                                                         SvgPicture.asset(
//                                                           "images/ac.svg",
//                                                           height: MediaQuery.of(context).size.height * 0.051,
//                                                         ),
//
//                                                       ),
//                                                       SizedBox(
//                                                         height: MediaQuery.of(context).size.height * 0.015,
//                                                       ),
//                                                       Container(
//                                                         child: Column(
//                                                           children: [
//                                                             Text(word['Device_Name'].toString(),style: const TextStyle(color: Colors.white),)
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   )))):
//                                       Text('Push',style: TextStyle(color: Colors.white));},).toList(),
//                                   )
//
//                                   ]
//                       //             Container(
//                       //               child: Container(
//                       //                   height: MediaQuery.of(context).size.height * 0.12,
//                       //                   // height: MediaQuery.of(context).size.height * 0.17,
//                       //                   // width: MediaQuery.of(context).size.width * 0.33,
//                       //                   margin: const EdgeInsets.all(10),
//                       //                   padding: const EdgeInsets.all(10),
//                       //                   decoration: BoxDecoration(
//                       //                       color: Colors.grey[900],
//                       //                       borderRadius: BorderRadius.circular(20),
//                       //                       boxShadow: [
//                       //                         BoxShadow(
//                       //                             offset: Offset(0, 0),
//                       //                             color: Colors.grey[700],
//                       //                             blurRadius: 1,
//                       //                             spreadRadius: 1),
//                       //                         BoxShadow(
//                       //                             offset: Offset(1, 1),
//                       //                             color: Colors.black87,
//                       //                             blurRadius: 1,
//                       //                             spreadRadius: 1)
//                       //                       ]),
//                       //                   child: Column(
//                       //                     mainAxisAlignment: MainAxisAlignment.center,
//                       //                     children: <Widget>[
//                       //                       Row(
//                       //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       //                         children: [
//                       //                           /*Text(data[i].toString().split("Slide")[0].replaceAll("_", " "),
//                       // style: GoogleFonts.robotoSlab(color: Colors.black)),*/
//                       //                           Text(
//                       //                               word['Device_Name'].toString().substring(0,1),style: const TextStyle(color: Colors.white)),
//                       //                         ],
//                       //                       ),
//                       //                       Container(
//                       //                         height: MediaQuery.of(context).size.height * 0.05,
//                       //                         child: Slider(
//                       //                           activeColor: Colors.yellowAccent,
//                       //                           inactiveColor: Colors.grey[500],
//                       //                           value: double.parse(word["Fan_Speed"]),
//                       //                           min: 0,
//                       //                           max: 4,
//                       //                           divisions: 4,
//                       //                           label: word["Fan_Speed"].toString().substring(0, 1),
//                       //                           onChangeEnd: (double value) {
//                       //                           },
//                       //                           onChanged: (double value) {
//                       //                             setState(() {
//                       //                               word["Fan_Speed"] = value.toString();
//                       //                             });
//                       //                           },
//                       //                         ),
//                       //                       )
//                       //                     ],
//                       //                   )),
//                       //             )
//                               ),
//
//                       ),
//                     ),
//                 ],
//               ),
//
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//


import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_size_text/auto_size_text.dart';


var dataJson;

class Button extends StatefulWidget {
//fuck
  final String place;
  final int ind;
  final String ipAddress;
  final Gradient g1;
  Button(this.place, this.ind, this.ipAddress, this.g1);

  @override
  _ButtonState createState() => _ButtonState();
}
//int globalIndex ;

class _ButtonState extends State<Button> {

  List data =[ ];
  List name = [];
  List pg = [];
  bool check;
  String localIp;
  Timer timer;
  int pageLoader ;
  String ip = null;
  SharedPreferences loginData;

  keyValues() async {

    loginData = await SharedPreferences.getInstance();
    final locIp = "192.168.1.18";
    //final onIp = loginData.getString('onlineIp') ?? null;

    if(locIp != null){
      //print("ipLocal is $ipLocal");
      // print("ip loc is $locIp ++++++");
      final response = await http.get(Uri.parse("http://$locIp/")).timeout(
          const Duration(milliseconds: 500),onTimeout: (){
        //ignore:avoid_print
        //print(" inside the timeout ");
        data.clear();
        ip = "192.168.1.18";
        loginData.setString('individualIp', ip);
        // setState(() {
        //   ip = onIp;
        //   loginData.setString('individualIp', ip);
        // });
        // data.clear();
        initial();
        return;
      });

      if(response.statusCode > 0){
        data.clear();
        ip = locIp;
        loginData.setString('individualIp', ip);
        // setState(() {
        //   //ignore:avoid_print
          //print("im inside the individual page if $locIp local ip");
        //   data.clear();
        //   ip = locIp;
        //   loginData.setString('individualIp', ip);
        //   //ignore:avoid_print
        //   print("im inside the if and the ipAddress is $ip ");
        // });
      }
      initial();
      //localDataVariableStorage();
    }else{
      initial();
    }

  }


  initial() async {
    //print("the ip value is in inidividual page $ip");
    loginData = await SharedPreferences.getInstance();
    // ip = loginData.getString('ip');
    data = loginData.getStringList('dataValues');
    // print("$ip --------------");
    //print("$data --------------");
    getName();
  }


  Future getName() async {
    pageLoader = 0;
    //print("$pageLoader the loader is before");

    // databaseReference.child(auth.currentUser.uid).once().then((DataSnapshot snapshot) async {
    //   setState(() {
    //     pageLoader = 1;
    //     //print("${auth.currentUser.uid} the uid is !!!!!!!!!");
    //     dataJson = snapshot.value;
    //     //print(dataJson);
    //   });
    // });

    setState(() {
      pageLoader = 1;
      //print("$pageLoader the loader is after");

    });

    //initial();

    //print("${data.length} the lenth of the in inidiviul");

    for (int i = 0; i < data.length; i++) {
      if (data[i].toString().contains("Admin Room") &&
          (!name.contains(data[i].toString().contains("Admin Room")))) {
        name.add("Admin Room");
        pg.add("Admin Room");
      } else if (data[i].toString().contains("Hall") &&
          (!name.contains(data[i].toString().contains("Hall")))) {
        name.add("Hall");
        pg.add("Hall");
      } else if (data[i].toString().contains("Living Room") &&
          (!name.contains(data[i].toString().contains("Living Room")))) {
        name.add("Living Room");
        pg.add("Living Room");
      } else if (data[i].toString().contains("Garage") &&
          (!name.contains(data[i].toString().contains("Garage")))) {
        name.add("Garage");
        pg.add("Garage");
      } else if (data[i].toString().contains("Kitchen") &&
          (!name.contains(data[i].toString().contains("Kitchen")))) {
        name.add("Kitchen");
        pg.add("Kitchen");
      } else if (data[i].toString().contains("Bathroom") &&
          (!name.contains(data[i].toString().contains("Bathroom")))) {
        name.add("Bathroom");
        pg.add("Bathroom");
      } else if (data[i].toString().contains("Master Bedroom") &&
          (!name.contains(data[i].toString().contains("Master Bedroom")))) {
        name.add("Master Bedroom");
        pg.add("Master Bedroom");
      } else if (data[i].toString().contains("Bedroom1") &&
          !name.contains(data[i].toString().contains("Bedroom1"))) {
        name.add("Bedroom1");
        //print("----- bedroom1 $name name -------");
        pg.add("Bedroom1");
        //print("----- bedroom1 $pg pg -------");
      } else if (data[i].toString().contains("Bedroom2") &&
          (!name.contains(data[i].toString().contains("Bedroom2")))) {
        name.add("Bedroom2");
        //print("----- bedroom1 $name name -------");
        pg.add("Bedroom2");
        //print("----- bedroom1 $pg pg -------");
      } else if (data[i].toString().contains("Bedroom") &&
          (!name.contains(data[i].toString().contains("Bedroom")))) {
        name.add("Bedroom");
        pg.add("Bedroom");
      } else if (data[i].toString().contains("Store Room") &&
          (!name.contains(data[i].toString().contains("Store Room")))) {
        name.add("Store Room");
        pg.add("Store Room");
      } else if (data[i].toString().contains("Outside") &&
          (!name.contains(data[i].toString().contains("Outside")))) {
        name.add("Outside");
        pg.add("Outside");
      } else if (data[i].toString().contains("Parking") &&
          (!name.contains(data[i].toString().contains("Parking")))) {
        name.add("Parking");
        pg.add("Parking");
      } else if (data[i].toString().contains("Outside") &&
          (!name.contains(data[i].toString().contains("Outside")))) {
        name.add("Outside");
        pg.add("Outside");
      } else if (data[i].toString().contains("Garden") &&
          (!name.contains(data[i].toString().contains("Garden")))) {
        name.add("Garden");
        pg.add("Garden");
      }
    }

    setState(() {
      name = name.toSet().toList();
      pg = pg.toSet().toList();
      // print(name);
    });
    return "success";
  }


  @override
  void initState() {
    //keyValues();
    // initial();
    Timer.periodic(Duration(seconds: 1), (Timer t)
    {
      keyValues();
    });
    // print("email ${widget.email} place ${widget.place} ind ${widget.ind} ");
    super.initState();
    // print("final url check $check");
  }

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.grey[900],
        backgroundColor: Theme.of(context).backgroundColor,
        body: PageView.builder(
            itemCount: pg.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Pages(name[widget.ind].toString(), widget.g1,widget.ind,ip);
              } else if (index == widget.ind) {
                return Pages(name[0].toString(), widget.g1,widget.ind,ip);
              } else {
                return Pages(name[index].toString(), widget.g1,widget.ind,ip);
              }
            }),
      ),
    );
  }
}





class Pages extends StatefulWidget {
  final String roomName;
  final int index;
  final Gradient g1;
  final String localIp;
  Pages(this.roomName, this.g1,this.index,this.localIp);
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> with WidgetsBindingObserver {

  List data = [ ] ;
  List dataValue = [ ] ;
  List<Container> buttonsList = List<Container>();
  String title;
  bool result = false;
  bool result2 = false;
  bool isSwitched;
  Timer timer;
  List name = [];
  List pg = [];
  String buttonName;
  String localIp;
  String up;
  SharedPreferences loginData;
  String ip;


  List<Widget> _buildButtonsWithNames() {
    //print(" im inside the buildbutton-------$buttonsList-------===========");
    buttonsList.clear();
    // print("data $data");
    // print("data ${data.length}");
    for (int i = 0; i < data.length; i++) {
      //print("im inside the build button");
      if(ip.toLowerCase().toString() == 'false'){
        //print(" !!!!!!!!!!!!!!!!!!!!!!!!! im inside the button online!!!!!!!!!!!!!!!!!!!!1 ");
        // buttonOnline(i);
      }
      else{
        //print("----------------- im inside the  buttonoffline ------------");
        buttonOffline(i);
      }

    }
    setState(() {
      buttonsList = buttonsList.toSet().toList();
    });
    //print(" im inside the buildbutton-------$buttonsList-------===========");
    return buttonsList;
  }

//   void buttonOnline(int i){
//     //print("${data[i]}");
//     if (data[i].toString().contains("Button") &&
//         data[i].toString().contains(widget.roomName)) {
//       // print("im inside the button above button list container");
//       // print("$buttonsList ");
//       // print("--------  ${data_value[i]} --------");
//       buttonsList.add(Container(
//         child: InkWell(
//             onTap: () {
// //print("im inside the inkwell on Tap()");
//               check().then((internet) {
//                 //print("im inside the inkwell");
//                 if (internet) {
//                   // Internet Present Case
//                   //print("im inside the button above if ");
//                   if ((dataValue[i] == true) || (dataValue[i] == "true")) {
//                     //print("im inside the if of inkwell ++++++++++");
//                     setState(() {
//                       dataValue[i] = false;
//                       up = "False";
//                     });
//                   } else {
//                     setState(() {
//                       dataValue[i] = true;
//                       up = "True";
//                     });
//                   }
//                   setState(() {
//                     // if(widget.check_url==false){
//                     //   update_value(data[i],data_value[0][i], i);
//                     // }else{
//                     //   update_value(data[i],up, i);
//                     // }
//                     updateValue(data[i],up, i);
//                     // print("${data_value[0][i]} data value is =================");
//                     // print("$up the value of up is *************");
//                     // print("$i after i is+++++++++++++++++------");
//                     _buildButtonsWithNames();
//                   });
//                   //print("Connection: present");
//                 } else {
//                   showDialog(
//                       context: context,
//                       builder: (_) => AlertDialog(
//                         backgroundColor: Colors.black,
//                         title: Text(
//                           "No Internet Connection",
//                           style :Theme.of(context).dialogTheme.titleTextStyle,
//                         ),
//                         content: Text(
//                           "Please check your Internet Connection",
//                           style: Theme.of(context).dialogTheme.contentTextStyle,),
//                       ));
//                   //print("Connection: not present");
//                 }
//               });
//             },
//             child: Container(
//                 height: MediaQuery.of(context).size.height * 0.17,
//                 width: MediaQuery.of(context).size.width * 0.37,
//                 padding: const EdgeInsets.all(10),
//                 margin: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: (dataValue[i] == true) || (dataValue[i] == "true") || (dataValue[i] == "0")? Colors.grey[900]:Colors.orange,
//                     borderRadius: BorderRadius.circular(20.0),
//                     boxShadow: [
//                       BoxShadow(
//                           offset: Offset(0, 0),
//                           color: Colors.grey[700],
//                           blurRadius: 1,
//                           spreadRadius: 1),
//                       BoxShadow(
//                           offset: Offset(1, 1),
//                           color: Colors.black87,
//                           blurRadius: 1,
//                           spreadRadius: 1)
//                     ]),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: MediaQuery.of(context).size.height * 0.08,
//                       width: MediaQuery.of(context).size.width * 0.25,
//                       child:
//                       SvgPicture.asset(
//                         "images/light.svg",
//                         height: MediaQuery.of(context).size.height * 0.010,
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.015,
//                     ),
//                     Container(
//                       child: Column(
//                         children: [
//                           (dataValue[i] == true) || (dataValue[i] == "true")
//                               ? AutoSizeText(
//                             data[i]
//                                 .toString()
//                                 .split("Button")[0]
//                                 .replaceAll("_", " ") +
//                                 "",
//                             style: GoogleFonts.robotoSlab(
//                               /*fontSize: 12,*/ color: Colors.white),
//                             maxLines: 1,
//                             minFontSize: 7,
//                           )
//                               : AutoSizeText(
//                             data[i]
//                                 .toString()
//                                 .split("Button")[0]
//                                 .replaceAll("_", " ") +
//                                 "",
//                             style: GoogleFonts.robotoSlab(
//                               /*fontSize: 12,*/ color: Colors.white),
//                             maxLines: 1,
//                             minFontSize: 7,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ))),
//       ));
//     }
//     else if (data[i].toString().contains("Push") &&
//         data[i].toString().contains(widget.roomName)) {
//       //print("--------  ${data_value[i]} --------");
//       buttonsList.add(Container(
//           child: InkWell(
//               onTap: () {
//                 check().then((intenet) {
//                   if (intenet) {
//                     // Internet Present Case
//                     if ((dataValue[i] == true) || (dataValue[i] == "true")) {
//                       setState(() {
//                         dataValue[i] = false;
//                         up = "False";
//                       });
//                     } else {
//                       setState(() {
//                         dataValue[i] = true;
//                         up = "True";
//                       });
//                     }
//                     setState(() {
//                       // if(widget.check_url==false){
//                       //   update_value(data[i],data_value[0][i], i);
//                       // }else{
//                       //   update_value(data[i],up, i);
//                       // }
//
//                       updateValue(data[i],up, i);
//                       _buildButtonsWithNames();
//                     });
//                     //print("Connection: present");
//                   } else {
//                     showDialog(
//                         context: context,
//                         builder: (_) => AlertDialog(
//                           backgroundColor: Colors.black,
//                           title: Text(
//                             "No Internet Connection",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           content: Text(
//                               "Please check your Internet Connection",
//                               style: TextStyle(color: Colors.white)),
//                         ));
//                     //print("Connection: not present");
//                   }
//                 });
//               },
//               child: Container(
//                 // height: MediaQuery.of(context).size.height * 0.12,
//                 // width: MediaQuery.of(context).size.width * 0.265,
//                   height: MediaQuery.of(context).size.height * 0.17,
//                   width: MediaQuery.of(context).size.width * 0.37,
//
//                   padding: const EdgeInsets.all(5),
//                   margin: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       color: (dataValue[i] == true) || (dataValue[i] == "true") || (dataValue[i] == "0")? Colors.grey[900]:Colors.orange,
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                             offset: Offset(0, 0),
//                             color: Colors.grey[700],
//                             blurRadius: 1,
//                             spreadRadius: 1),
//                         BoxShadow(
//                             offset: Offset(1, 1),
//                             color: Colors.black87,
//                             blurRadius: 1,
//                             spreadRadius: 1)
//                       ]),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: MediaQuery.of(context).size.height * 0.04,
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         margin: EdgeInsets.only(top: 10),
//                         child:
//                         SvgPicture.asset(
//                           "images/ac.svg",
//                           height: MediaQuery.of(context).size.height * 0.051,
//                         ),
//
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.015,
//                       ),
//                       Container(
//                         child: Column(
//                           children: [
//                             (dataValue[i] == true) || (dataValue[i] == "true")
//                                 ? AutoSizeText(
//                               data[i]
//                                   .toString()
//                                   .split("Fan")[0]
//                                   .replaceAll("_", " ") +
//                                   "",
//                               style: GoogleFonts.robotoSlab(
//                                 color: Colors.white, /*fontSize: 12*/
//                               ),
//                               maxLines: 1,
//                               minFontSize: 10,
//                             )
//                                 : AutoSizeText(
//                               data[i]
//                                   .toString()
//                                   .split("Fan")[0]
//                                   .replaceAll("_", " ") +
//                                   "",
//                               style: GoogleFonts.robotoSlab(
//                                 /*fontSize: 12,*/ color: Colors.white),
//                               maxLines: 1,
//                               minFontSize: 10,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   )))));
//     }
//     else if (data[i].toString().contains("Slide") &&
//         data[i].toString().contains(widget.roomName)) {
//       //print("--------  ${data_value[i]} --------");
//       buttonsList.add(
//           Container(
//             child: Container(
//                 height: MediaQuery.of(context).size.height * 0.12,
//                 // height: MediaQuery.of(context).size.height * 0.17,
//                 // width: MediaQuery.of(context).size.width * 0.33,
//                 margin: const EdgeInsets.all(10),
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: Colors.grey[900],
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                           offset: Offset(0, 0),
//                           color: Colors.grey[700],
//                           blurRadius: 1,
//                           spreadRadius: 1),
//                       BoxShadow(
//                           offset: Offset(1, 1),
//                           color: Colors.black87,
//                           blurRadius: 1,
//                           spreadRadius: 1)
//                     ]),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         /*Text(data[i].toString().split("Slide")[0].replaceAll("_", " "),
//                       style: GoogleFonts.robotoSlab(color: Colors.black)),*/
//                         Text(
//                             "Fan Speed  ${dataValue[i].toString().substring(0, 1)}",
//                             style: GoogleFonts.robotoSlab(color: Colors.white)),
//                       ],
//                     ),
//                     Container(
//                       height: MediaQuery.of(context).size.height * 0.05,
//                       child: Slider(
//                         activeColor: Colors.yellowAccent,
//                         inactiveColor: Colors.grey[500],
//                         value: double.parse(dataValue[i].toString()),
//                         min: 0,
//                         max: 4,
//                         divisions: 4,
//                         label: dataValue[i].toString().substring(0, 1),
//                         onChangeEnd: (double value) {
//                           check().then((intenet) {
//                             if (intenet) {
//                               // Internet Present Case
//                               setState(() {
//                                 dataValue[i] = value.toInt().toString();
//                                 /*update_value(data[i], data_value[0][i], i);
//                           _buildButtonsWithNames();*/
//                               });
//                               //print("Connection: present");
//                             } else {
//                               showDialog(
//                                   context: context,
//                                   builder: (_) => AlertDialog(
//                                     backgroundColor: Colors.black,
//                                     title: Text(
//                                       "No Internet Connection",
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                     content: Text(
//                                         "Please check your Internet Connection",
//                                         style: TextStyle(color: Colors.white)),
//                                   ));
//                             }
//                             setState(() {
//                               updateValue(data[i], dataValue[i], i);
//                               _buildButtonsWithNames();
//                             });
//                           });
//                         },
//                         onChanged: (double value) {
//                           setState(() {
//                             dataValue[i] = value.toString();
//                           });
//                         },
//                       ),
//                     )
//                   ],
//                 )),
//           ));
//     }
//     else if (data[i].toString().contains("Switch") &&
//         data[i].toString().contains(widget.roomName)) {
//       //print("--------  ${data_value[i]} --------");
//       buttonsList.add(Container(
//           child: InkWell(
//               onTap: () {
//                 check().then((intenet) {
//                   if (intenet) {
//                     // Internet Present Case
//                     if ((dataValue[i] == true) || (dataValue[i] == "true")) {
//                       setState(() {
//                         dataValue[i] = false;
//                         up = "False";
//                       });
//                     } else {
//                       setState(() {
//                         dataValue[i] = true;
//                         up = "True";
//                       });
//                     }
//                     setState(() {
//                       // if(widget.check_url==false){
//                       //   update_value(data[i],data_value[0][i], i);
//                       // }else{
//                       //   update_value(data[i],up, i);
//                       // }
//
//                       updateValue(data[i],up, i);
//                       _buildButtonsWithNames();
//                     });
//                     //print("Connection: present");
//                   } else {
//                     showDialog(
//                         context: context,
//                         builder: (_) => AlertDialog(
//                           backgroundColor: Colors.black,
//                           title: Text(
//                             "No Internet Connection",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           content: Text(
//                               "Please check your Internet Connection",
//                               style: TextStyle(color: Colors.white)),
//                         ));
//                     //print("Connection: not present");
//                   }
//                 });
//               },
//               child: Container(
//                 // height: MediaQuery.of(context).size.height * 0.12,
//                 // width: MediaQuery.of(context).size.width * 0.265,
//                   height: MediaQuery.of(context).size.height * 0.17,
//                   width: MediaQuery.of(context).size.width * 0.37,
//
//                   padding: const EdgeInsets.all(5),
//                   margin: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       color: (dataValue[i] == true) || (dataValue[i] == "true") || (dataValue[i] == "0")? Colors.grey[900]:Colors.orange,
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                             offset: Offset(0, 0),
//                             color: Colors.grey[700],
//                             blurRadius: 1,
//                             spreadRadius: 1),
//                         BoxShadow(
//                             offset: Offset(1, 1),
//                             color: Colors.black87,
//                             blurRadius: 1,
//                             spreadRadius: 1)
//                       ]),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: MediaQuery.of(context).size.height * 0.04,
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         margin: EdgeInsets.only(top: 10),
//                         child:
//                         SvgPicture.asset(
//                           "images/ac.svg",
//                           height: MediaQuery.of(context).size.height * 0.051,
//                         ),
//
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.015,
//                       ),
//                       Container(
//                         child: Column(
//                           children: [
//                             (dataValue[i] == true) || (dataValue[i] == "true")
//                                 ? AutoSizeText(
//                               data[i]
//                                   .toString()
//                                   .split("Switch")[0]
//                                   .replaceAll("_", " ") +
//                                   "",
//                               style: GoogleFonts.robotoSlab(
//                                 color: Colors.white, /*fontSize: 12*/
//                               ),
//                               maxLines: 1,
//                               minFontSize: 10,
//                             )
//                                 : AutoSizeText(
//                               data[i]
//                                   .toString()
//                                   .split("Switch")[0]
//                                   .replaceAll("_", " ") +
//                                   "",
//                               style: GoogleFonts.robotoSlab(
//                                 /*fontSize: 12,*/ color: Colors.white),
//                               maxLines: 1,
//                               minFontSize: 10,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   )))));
//     }
//   }

  void buttonOffline(int i) {
    // print("${widget.roomName}");
    // // print("${data[i]} fucker");
    //print("${dataValue[i]["Fan_Name"]} sucker **********");
    if (dataValue[i]["Device_Type"].toString().contains("Light") &&
        dataValue[i]["Room"].toString().contains(widget.roomName)) {
       //print("im inside the button above button list container ${dataValue[i]}");
      // print("$buttonsList ");
      buttonsList.add(Container(
        child: InkWell(
            onTap: () {
              print("im inside the inkwell on Tap()");
              print(dataValue[i]["Room"]);
              print(dataValue[i]["Device_Type"]);
              print(dataValue[i]["Device_Name"]);
              print(dataValue[i]["id"]);
              print(dataValue[i]["Device_Status"]);
              setState(() {
                dataValue[i]["Device_Status"] = !dataValue[i]["Device_Status"];
                print(dataValue[i]["Device_Status"]);
                updateValue(dataValue[i]["id"],dataValue[i]["Device_Name"],dataValue[i]["Device_Status"],0);
              });
              print(dataValue[i]["Device_Status"]);
              // check().then((intenet) {
              //   //print("im inside the inkwell");
              //   if (intenet) {
              //     // Internet Present Case
              //     //print("im inside the button above if ");
              //     if ((dataValue[0][i] == 1) || (dataValue[0][i] == "1")) {
              //       //print("im inside the if of inkwell ++++++++++");
              //       setState(() {
              //         dataValue[0][i] = 0;
              //         up = "False";
              //       });
              //     } else {
              //       setState(() {
              //         dataValue[0][i] = 1;
              //         up = "True";
              //       });
              //     }
              //     setState(() {
              //       // if(widget.check_url==false){
              //       //   update_value(data[i],data_value[0][i], i);
              //       // }else{
              //       //   update_value(data[i],up, i);
              //       // }
              //       updateValue(data[i],up, i);
              //       // print("${data_value[0][i]} data value is =================");
              //       // print("$up the value of up is *************");
              //       // print("$i after i is+++++++++++++++++------");
              //       _buildButtonsWithNames();
              //     });
              //     //print("Connection: present");
              //   } else {
              //     showDialog(
              //         context: context,
              //         builder: (_) => AlertDialog(
              //           backgroundColor: Colors.black,
              //           title: Text(
              //             "No Internet Connection",
              //             style: TextStyle(color: Colors.white),
              //           ),
              //           content: Text(
              //               "Please check your Internet Connection",
              //               style: TextStyle(color: Colors.white)),
              //         ));
              //     //print("Connection: not present");
              //   }
              // });
            },
            child: Container(
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width * 0.37,
                padding: const EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                   color: !dataValue[i]["Device_Status"] ? Colors.grey[900]:Colors.orange,
                    //color: Colors.orange,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          color: Colors.grey[700],
                          blurRadius: 1,
                          spreadRadius: 1),
                      BoxShadow(
                          offset: Offset(1, 1),
                          color: Colors.black87,
                          blurRadius: 1,
                          spreadRadius: 1)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child:
                      SvgPicture.asset(
                        "images/light.svg",
                        height: MediaQuery.of(context).size.height * 0.010,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Container(
                      child: Column(
                        children: [
                          AutoSizeText(
                            dataValue[i]["Device_Name"].toString(),
                            style: GoogleFonts.robotoSlab(
                              /*fontSize: 12,*/ color: Colors.white),
                            maxLines: 1,
                            minFontSize: 7,
                          )
                        ],
                      ),
                    ),
                  ],
                ))),
      ));
    }
    else if (dataValue[i]["Device_Type"].toString().contains("Switch") &&
        dataValue[i]["Room"].toString().contains(widget.roomName)) {
      buttonsList.add(Container(
          child: InkWell(
              onTap: () {
                setState(() {
                  dataValue[i]["Device_Status"] = !dataValue[i]["Device_Status"];
                  updateValue(dataValue[i]["id"],dataValue[i]["Device_Name"],dataValue[i]["Device_Status"],0);
                  //updateValue(dataValue[i]["id"],dataValue[i]["Device_Status"]);
                });

                // check().then((intenet) {
                //   if (intenet) {
                //     // Internet Present Case
                //     if ((dataValue[0][i] == 1) || (dataValue[0][i] == "1")) {
                //       setState(() {
                //         dataValue[0][i] = 0;
                //         up = "False";
                //       });
                //     } else {
                //       setState(() {
                //         dataValue[0][i] = 1;
                //         up = "True";
                //       });
                //     }
                //     setState(() {
                //       // if(widget.check_url==false){
                //       //   update_value(data[i],data_value[0][i], i);
                //       // }else{
                //       //   update_value(data[i],up, i);
                //       // }
                //
                //       updateValue(data[i],up, i);
                //       _buildButtonsWithNames();
                //     });
                //     //print("Connection: present");
                //   } else {
                //     showDialog(
                //         context: context,
                //         builder: (_) => AlertDialog(
                //           backgroundColor: Colors.black,
                //           title: Text(
                //             "No Internet Connection",
                //             style: TextStyle(color: Colors.white),
                //           ),
                //           content: Text(
                //               "Please check your Internet Connection",
                //               style: TextStyle(color: Colors.white)),
                //         ));
                //     //print("Connection: not present");
                //   }
                // });
              },
              child: Container(
                // height: MediaQuery.of(context).size.height * 0.12,
                // width: MediaQuery.of(context).size.width * 0.265,
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width * 0.37,

                  padding: const EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: !dataValue[i]["Device_Status"]? Colors.grey[900]:Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.grey[700],
                            blurRadius: 1,
                            spreadRadius: 1),
                        BoxShadow(
                            offset: Offset(1, 1),
                            color: Colors.black87,
                            blurRadius: 1,
                            spreadRadius: 1)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.2,
                        margin: EdgeInsets.only(top: 10),
                        child:
                        SvgPicture.asset(
                          "images/ac.svg",
                          height: MediaQuery.of(context).size.height * 0.051,
                        ),

                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      Container(
                        child: Column(
                          children: [
                            AutoSizeText(
                              dataValue[i]["Device_Name"].toString(),
                              style: GoogleFonts.robotoSlab(
                                /*fontSize: 12,*/ color: Colors.white),
                              maxLines: 1,
                              minFontSize: 7,
                            )
                          ],
                        ),
                      ),
                    ],
                  )))));
    }
    else if (dataValue[i]["Fan_Name"].toString().contains("Fan") &&
        dataValue[i]["Room"].toString().contains(widget.roomName)) {
      buttonsList.add(Container(
        child: Container(
            height: MediaQuery.of(context).size.height * 0.12,
            // height: MediaQuery.of(context).size.height * 0.17,
            // width: MediaQuery.of(context).size.width * 0.33,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      color: Colors.grey[700],
                      blurRadius: 1,
                      spreadRadius: 1),
                  BoxShadow(
                      offset: Offset(1, 1),
                      color: Colors.black87,
                      blurRadius: 1,
                      spreadRadius: 1)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /*Text(data[i].toString().split("Slide")[0].replaceAll("_", " "),
                      style: GoogleFonts.robotoSlab(color: Colors.black)),*/
                    Text(
                        dataValue[i]["Fan_Name"].toString(),
                        style: GoogleFonts.robotoSlab(color: Colors.white)),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Slider(
                    activeColor: Colors.yellowAccent,
                    inactiveColor: Colors.grey[500],
                    value: double.parse(dataValue[i]["Fan_Speed"].toString()),
                    min: 0,
                    max: 4,
                    divisions: 4,
                    label: dataValue[i]["Fan_Speed"].toString().substring(0, 1),
                    onChangeEnd: (double value) {
                      setState(() {
                        updateValue(dataValue[i]["id"],dataValue[i]["Fan_Name"],dataValue[i]["Fan_Status"],dataValue[i]["Fan_Speed"]);
                        //updateValue(dataValue[i]["id"], status)
                      });
                      // check().then((intenet) {
                      //   if (intenet) {
                      //     // Internet Present Case
                      //
                      //     setState(() {
                      //       dataValue[0][i] = value.toInt().toString();
                      //       /*update_value(data[i], data_value[0][i], i);
                      //     _buildButtonsWithNames();*/
                      //     });
                      //     //print("Connection: present");
                      //   } else {
                      //     showDialog(
                      //         context: context,
                      //         builder: (_) => AlertDialog(
                      //           backgroundColor: Colors.black,
                      //           title: Text(
                      //             "No Internet Connection",
                      //             style: TextStyle(color: Colors.white),
                      //           ),
                      //           content: Text(
                      //               "Please check your Internet Connection",
                      //               style: TextStyle(color: Colors.white)),
                      //         ));
                      //   }
                      //   setState(() {
                      //     updateValue(data[i], dataValue[0][i], i);
                      //     _buildButtonsWithNames();
                      //   });
                      // });
                    },
                    onChanged: (double value) {
                      print("value of fan is $value");
                      setState(() {
                        dataValue[i]["Fan_Speed"] = value;
                        print("datavalue is ${dataValue[i]["Fan_Speed"]}");
                      });
                    },
                  ),
                )
              ],
            )),
      ));
    }
    // else if (data[i].toString().contains("Switch") &&
    //     data[i].toString().contains(widget.roomName)) {
    //   buttonsList.add(Container(
    //       child: InkWell(
    //           onTap: () {
    //             check().then((intenet) {
    //               if (intenet) {
    //                 // Internet Present Case
    //                 if ((dataValue[0][i] == 1) || (dataValue[0][i] == "1")) {
    //                   setState(() {
    //                     dataValue[0][i] = 0;
    //                     up = "False";
    //                   });
    //                 } else {
    //                   setState(() {
    //                     dataValue[0][i] = 1;
    //                     up = "True";
    //                   });
    //                 }
    //                 setState(() {
    //                   // if(widget.check_url==false){
    //                   //   update_value(data[i],data_value[0][i], i);
    //                   // }else{
    //                   //   update_value(data[i],up, i);
    //                   // }
    //
    //                   updateValue(data[i],up, i);
    //                   _buildButtonsWithNames();
    //                 });
    //                 //print("Connection: present");
    //               } else {
    //                 showDialog(
    //                     context: context,
    //                     builder: (_) => AlertDialog(
    //                       backgroundColor: Colors.black,
    //                       title: Text(
    //                         "No Internet Connection",
    //                         style: TextStyle(color: Colors.white),
    //                       ),
    //                       content: Text(
    //                           "Please check your Internet Connection",
    //                           style: TextStyle(color: Colors.white)),
    //                     ));
    //                 //print("Connection: not present");
    //               }
    //             });
    //           },
    //           child: Container(
    //             // height: MediaQuery.of(context).size.height * 0.12,
    //             // width: MediaQuery.of(context).size.width * 0.265,
    //               height: MediaQuery.of(context).size.height * 0.17,
    //               width: MediaQuery.of(context).size.width * 0.37,
    //
    //               padding: const EdgeInsets.all(5),
    //               margin: EdgeInsets.all(10),
    //               decoration: BoxDecoration(
    //                   color: (dataValue[0][i] == 0) || (dataValue[0][i] == "0")? Colors.grey[900]:Colors.orange,
    //                   borderRadius: BorderRadius.circular(20),
    //                   boxShadow: [
    //                     BoxShadow(
    //                         offset: Offset(0, 0),
    //                         color: Colors.grey[700],
    //                         blurRadius: 1,
    //                         spreadRadius: 1),
    //                     BoxShadow(
    //                         offset: Offset(1, 1),
    //                         color: Colors.black87,
    //                         blurRadius: 1,
    //                         spreadRadius: 1)
    //                   ]),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Container(
    //                     height: MediaQuery.of(context).size.height * 0.04,
    //                     width: MediaQuery.of(context).size.width * 0.2,
    //                     margin: EdgeInsets.only(top: 10),
    //                     child:
    //                     SvgPicture.asset(
    //                       "images/ac.svg",
    //                       height: MediaQuery.of(context).size.height * 0.051,
    //                     ),
    //
    //                   ),
    //                   SizedBox(
    //                     height: MediaQuery.of(context).size.height * 0.015,
    //                   ),
    //                   Container(
    //                     child: Column(
    //                       children: [
    //                         (dataValue[0][i] == 1) || (dataValue[0][i] == "1")
    //                             ? AutoSizeText(
    //                           data[i]
    //                               .toString()
    //                               .split("Switch")[0]
    //                               .replaceAll("_", " ") +
    //                               "",
    //                           style: GoogleFonts.robotoSlab(
    //                             color: Colors.white, /*fontSize: 12*/
    //                           ),
    //                           maxLines: 1,
    //                           minFontSize: 10,
    //                         )
    //                             : AutoSizeText(
    //                           data[i]
    //                               .toString()
    //                               .split("Switch")[0]
    //                               .replaceAll("_", " ") +
    //                               "",
    //                           style: GoogleFonts.robotoSlab(
    //                             /*fontSize: 12,*/ color: Colors.white),
    //                           maxLines: 1,
    //                           minFontSize: 10,
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               )))));
    // }
  }


  void initial() async {
    //print("im inise the init");
    loginData = await SharedPreferences.getInstance();
    setState(() {
      ip = loginData.getString('individualIp');
      //ip = widget.localIp;
      //data = loginData.getStringList('dataValues');
      //result = true;
    });
    // ip = loginData.getString('individualIp');
    // //ip = widget.localIp;
    // data = loginData.getStringList('dataValues');
    // print("$ip --------------");
    // print("$data --------------");

    //getName();

  }

  updateValue(id,name,status,speed) async {
    //print("--------  im inside the update value   0----0099898");
    // print("$id id $name name $status  sts $speed speed ");

    if (ip.toString() != 'false') {
      // print("values inisde the id $id & Sts $status");
      //final response = await http.get( Uri.http("$ip", "/$button/$buttonValue"));
      setState(() {
        if(name == "Fan"){
          // print("im inisde the fan $name $speed");
          // print("type ${speed.runtimeType}");
          int fan_speed =  speed.toInt();
          // fan_speed = fan_speed.toInt();
          // print(fan_speed);
          // print(fan_speed.runtimeType);
          http.put(
            Uri.parse('http://192.168.1.18/fan/$id/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, int>{
              'Fan_Speed': fan_speed,
            }),
          );
        }else{
          http.put(
            Uri.parse('http://192.168.1.18/$id/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, bool>{
              'Device_Status': status,
            }),
          );


        }

      });

      // if (response.statusCode == 200) {
      setState(() {
        result = true;
        //print("im inside the update the value");
      });
      // result = true;
      // print("im inside the update the value");
      //print("response 1 : ${response.body}");
      // if (response.body != "success");
      // _showScaffold("Update Failed, Please check server or internet connection and retry");
      //}
      // else {
      //   if ((dataValue[0][i] == 0) || (dataValue[0][i] == "0")) {
      //     setState(() {
      //       print("im inside the else iffffff loop of update value");
      //       dataValue[0][i] = 1;
      //       _buildButtonsWithNames();
      //     });
      //   } else {
      //     setState(() {
      //       print("im inside the else case of update values");
      //       dataValue[0][i] = 0;
      //       _buildButtonsWithNames();
      //     });
      //   }
      //   result = false;
      //   // If the server did not return a 200 OK response,
      //   // then throw an exception.
      //   throw Exception('Failed to load album');
      // }
      //return response;
    }
    else if(ip.toString() == 'false'){
      // databaseReference.child(auth.currentUser.uid).update({
      //   button : buttonValue
      // });
      result = true;
    }
  }
  // updateValue(button, buttonValue, i) async {
  //   print("--------  im inside the update value   0----0099898");
  //
  //   databaseReference.child(auth.currentUser.uid).once().then((
  //       DataSnapshot snapshot) async {
  //     setState(() {
  //       print("${auth.currentUser.uid}");
  //       dataJson = snapshot.value;
  //       //print(dataJson);
  //     });
  //   });
  //
  //   if (ip.toLowerCase().toString() != 'false') {
  //     final response = await http.get( Uri.http("$ip", "/$button/$buttonValue"));
  //     if (response.statusCode == 200) {
  //       result = true;
  //       print("im inside the update the value");
  //       //print("response 1 : ${response.body}");
  //       if (response.body != "success");
  //       // _showScaffold("Update Failed, Please check server or internet connection and retry");
  //     } else {
  //       if ((dataValue[0][i] == 0) || (dataValue[0][i] == "0")) {
  //         setState(() {
  //           print("im inside the else iffffff loop of update value");
  //           dataValue[0][i] = 1;
  //           _buildButtonsWithNames();
  //         });
  //       } else {
  //         setState(() {
  //           print("im inside the else case of update values");
  //           dataValue[0][i] = 0;
  //           _buildButtonsWithNames();
  //         });
  //       }
  //       result = false;
  //       // If the server did not return a 200 OK response,
  //       // then throw an exception.
  //       throw Exception('Failed to load album');
  //     }
  //     return response;
  //   }
  //   else if(ip.toLowerCase().toString() == 'false'){
  //     databaseReference.child(auth.currentUser.uid).update({
  //       button : buttonValue
  //     });
  //     result = true;
  //   }
  // }

  call() async {
    //initial();
     print("im inside the calll 0----0099898");
     print("the ip inside the call is $ip");
    if(ip.toString() != 'false') {
      print("the ip inside the call is $ip");
      // print("im inside the if loop of call +++++++++++++++++ *********************");
      final response = await http.get(Uri.parse("http://$ip/"));
      final fanResponse = await http.get(Uri.parse("http://$ip/fan/"));

      var val = jsonDecode(response.body);
      var fan = jsonDecode(fanResponse.body);
      // if (response.statusCode == 200) {
      // print("response: ${response.statusCode}");
      setState(() {
        data.clear();
        //data = val["Room"];
        for(int i = 0 ; i<val.length ; i++){
          data.add(val[i]["Room"]);
        }
        for(int i = 0 ; i< fan.length ; i++){
          //print("room ${widget.roomName}");
          if(widget.roomName == fan[i]["Room"]){
            print("fan data ${fan[i]["Room"]}");
            data.add(fan[i]["Room"]);
            print("im printing");
          }
        }
        result = true;
        print("$data inside the value of setstate in if case");
      });

      return response;
    }

    // else if(ip.toLowerCase().toString() == 'false'){
    //   //print("im inside the else if of call()");
    //   setState(() {
    //     data = dataJson.keys.toList();
    //     //print("----- $data --------");
    //   });
    //
    //   result = true;
    // }
  }

//call
  // call() async {
  //   //print("im inside the calll 0----0099898");
  //   databaseReference.child(auth.currentUser.uid).once().then((DataSnapshot snapshot) async {
  //     setState(() {
  //       dataJson = snapshot.value;
  //       //print(dataJson);
  //     });
  //   });
  //   if(ip.toString() != 'false') {
  //     print("the ip inside the call is $ip");
  //     print("im inside the if loop of call +++++++++++++++++ *********************");
  //     final response = await http.get(Uri.http("$ip", "/key"));
  //     if (response.statusCode == 200) {
  //       // print("response: ${response.statusCode}");
  //       setState(() {
  //         data = jsonDecode(response.body);
  //         print("$data inside the value of setstate in if case");
  //       });
  //
  //       // print("values $data");
  //       // print("response: ${response.body}");
  //       result = true;
  //       // If the server did return a 200 OK response,
  //       // then parse the JSON.
  //       //  return Album.fromJson(json.decode(response.body));
  //     }
  //     // setState(() {
  //     //   data = jsonDecode(response.body);
  //     //   print("$data inside the value of setstate in if case");
  //     // });
  //     // // print("values $data");
  //     // // print("response: ${response.body}");
  //     // result = true;
  //     else {
  //       setState(() {
  //         result = false;
  //       });
  //       // If the server did not return a 200 OK response,
  //       // then throw an exception.
  //       throw Exception('Failed to load album');
  //     }
  //     return response;
  //   }
  //   else if(ip.toLowerCase().toString() == 'false'){
  //     //print("im inside the else if of call()");
  //     setState(() {
  //       data = dataJson.keys.toList();
  //       //print("----- $data --------");
  //     });
  //
  //     result = true;
  //   }
  // }
//callby value
//   callByValue() async {
//
//     print("im inside the call by 74873268768723657 value 0----0099898");
//     databaseReference.child(auth.currentUser.uid).once().then((DataSnapshot snapshot) async {
//       setState(() {
//         dataJson = snapshot.value;
//         //print(dataJson);
//       });
//     });
//
//     if(ip.toLowerCase().toString() != 'false') {
//       print("im inside the if loop of call_value *********************");
//       final response = await http.get(Uri.http("$ip", "/value"));
//
//       if (response.statusCode == 200) {
//         print("response: ${response.statusCode}");
//         setState(() {
//           dataValue = jsonDecode(response.body);
//           //print("-----$data_value  value of data_value-----");
//         });
//         // print("response 2: ${response.body}");
//         result2 = true;
//
//         Future.delayed(const Duration(seconds: 1), () {
// // Here you can write your code
//
//           for (int i = 0; i < dataValue.length; i++) {
//             //print("${data_value.length} the value inside the setstate of data_value");
//             dataValue[0][i] = dataValue[0][i];
//             //print("${data_value[0][i]} the value of data_value");
//           }
//
//
//           //print("im inside the if of future delay");
//           // setState(() {***************************************************
//           //   //print("****************************we are checking the below line**********************************************");
//           //   // print("after");
//           //
//           //   for (int i = 0; i < dataValue.length; i++) {
//           //     //print("${data_value.length} the value inside the setstate of data_value");
//           //     dataValue[0][i] = dataValue[0][i];
//           //     //print("${data_value[0][i]} the value of data_value");
//           //   }
//           //
//           //   // _buildButtonsWithNames();
//           //
//           //   // Here you can write your code for open new view
//           // });*************************************************************
//         });
//         // If the server did return a 200 OK response,
//         // then parse the JSON.
//         //  return Album.fromJson(json.decode(response.body));
//       } else {
//         setState(() {
//           result2 = false;
//         });
//         // If the server did not return a 200 OK response,
//         // then throw an exception.
//         throw Exception('Failed to load album');
//       }
//       return true;
//     }
//     else if(ip.toLowerCase().toString() == 'false'){
//       //print("im inside the else if of call_value()");
//       setState(() {
//         dataValue = dataJson.values.toList();
//         //print("$data_value the data value inside the call_by setsstate");
//       });
//       result2 = true;
//
//       Future.delayed(const Duration(seconds: 5), () {
// // Here you can write your code
// //         print("im inside the future delay !!!!!!!!!!!!!!1111");
// //         print(data_value);
// //         print(data_value.length);
// //         print("im inside the future delay !!!!!!!!!!!!!!1111");
//         setState(() {
//           // print("after");
//           //print("${data_value.length} the length of data values indidde the call by setstate");
//           for (int i = 0; i < dataValue.length; i++) {
//             print(dataValue[i]);
//             //print(data_value[0][i]);
//             dataValue[i] = dataValue[i];
//           }
//           // _buildButtonsWithNames();
//           // Here you can write your code for open new view
//         });
//       });
//     }
//   }
  callByValue() async {
    //print("im inside the call by and the $ip");
    if(ip.toLowerCase().toString() != 'false') {
      //print("im inside the if loop of call_value *********************");
      final response = await http.get(Uri.parse("http://$ip/"));
      final fanResponse = await http.get(Uri.parse("http://$ip/fan/"));
      var val = jsonDecode(response.body);
      var fan = jsonDecode(fanResponse.body);
      // print("value in cal by is $val");
      setState(() {
        dataValue.clear();
        for(int i = 0 ; i<val.length ; i++){
          dataValue.add(val[i]);
        }
        for(int i = 0 ; i<fan.length ; i++){
          //print("widget ${widget.roomName}");
          if(widget.roomName == fan[i]["Room"]){
            dataValue.add(fan[i]);
            //print("datavalue is ${dataValue[20]}");
            //print("im printing");
          }
        }
        //dataValue = val;
        //print("-----$dataValue  value of data_value-----");
        result2 = true;
      });
      // print("response 2: ${response.body}");
      //result2 = true;

//       Future.delayed(const Duration(milliseconds: 500), () {
// // Here you can write your code
//         for (int i = 0; i < dataValue.length; i++) {
//           //print("${data_value.length} the value inside the setstate of data_value");
//           dataValue[0][i] = dataValue[0][i];
//           //print("${data_value[0][i]} the value of data_value");
//         }
//       });
      return true;
    }
  }


  // getName() async {
  //
  //   // print("${data.length} the getName");
  //   // print("$data in the individual page ");
  //
  //   for (int i = 0; i < data.length; i++) {
  //     if (data[i].toString().contains("Admin Room") &&
  //         (!name.contains(data[i].toString().contains("Admin Room")))) {
  //       name.add("Admin Room");
  //       pg.add("Admin Room");
  //     } else if (data[i].toString().contains("Hall") &&
  //         (!name.contains(data[i].toString().contains("Hall")))) {
  //       name.add("Hall");
  //       pg.add("Hall");
  //     } else if (data[i].toString().contains("Living Room") &&
  //         (!name.contains(data[i].toString().contains("Living Room")))) {
  //       name.add("Living Room");
  //       pg.add("Living Room");
  //     } else if (data[i].toString().contains("Garage") &&
  //         (!name.contains(data[i].toString().contains("Garage")))) {
  //       name.add("Garage");
  //       pg.add("Garage");
  //     } else if (data[i].toString().contains("Kitchen") &&
  //         (!name.contains(data[i].toString().contains("Kitchen")))) {
  //       name.add("Kitchen");
  //       pg.add("Kitchen");
  //     } else if (data[i].toString().contains("Bathroom") &&
  //         (!name.contains(data[i].toString().contains("Bathroom")))) {
  //       name.add("Bathroom");
  //       pg.add("Bathroom");
  //     } else if (data[i].toString().contains("Master Bedroom") &&
  //         (!name.contains(data[i].toString().contains("Master Bedroom")))) {
  //       name.add("Master Bedroom");
  //       pg.add("Master Bedroom");
  //     } else if (data[i].toString().contains("Bedroom1") &&
  //         !name.contains(data[i].toString().contains("Bedroom1"))) {
  //       name.add("Bedroom1");
  //       //print("----- bedroom1 $name name -------");
  //       pg.add("Bedroom1");
  //       //print("----- bedroom1 $pg pg -------");
  //     } else if (data[i].toString().contains("Bedroom2") &&
  //         (!name.contains(data[i].toString().contains("Bedroom2")))) {
  //       name.add("Bedroom2");
  //       //print("----- bedroom1 $name name -------");
  //       pg.add("Bedroom2");
  //       //print("----- bedroom1 $pg pg -------");
  //     } else if (data[i].toString().contains("Bedroom") &&
  //         (!name.contains(data[i].toString().contains("Bedroom")))) {
  //       name.add("Bedroom");
  //       pg.add("Bedroom");
  //     } else if (data[i].toString().contains("Store Room") &&
  //         (!name.contains(data[i].toString().contains("Store Room")))) {
  //       name.add("Store Room");
  //       pg.add("Store Room");
  //     } else if (data[i].toString().contains("Outside") &&
  //         (!name.contains(data[i].toString().contains("Outside")))) {
  //       name.add("Outside");
  //       pg.add("Outside");
  //     } else if (data[i].toString().contains("Parking") &&
  //         (!name.contains(data[i].toString().contains("Parking")))) {
  //       name.add("Parking");
  //       pg.add("Parking");
  //     }else if (data[i].toString().contains("Garden") &&
  //         (!name.contains(data[i].toString().contains("Garden")))) {
  //       name.add("Garden");
  //       pg.add("Garden");
  //     }
  //   }
  //
  //   // name = name.toSet().toList();
  //   // pg = pg.toSet().toList();
  //
  //   setState(() {
  //     name = name.toSet().toList();
  //     pg = pg.toSet().toList();
  //     //print("$name  of the individual page");
  //   });
  //
  //   return "success";
  // }

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    initial();
    call();
    timer = Timer.periodic(
        Duration(seconds: 2),
            (Timer t) => callByValue());

    check().then((intenet) {
      if (intenet) {
        call().then((value) => callByValue());

      }
      // });
      else {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: Colors.black,
              title: Text(
                "No Internet Connection",
                style: TextStyle(color: Colors.white),
              ),
              content: Text("Please check your Internet Connection",
                  style: TextStyle(color: Colors.white)),
            ));
        //print("Connection: not present");
      }
    });

    // timer = Timer.periodic(
    //     Duration(seconds: 1),
    //         (Timer t) => check().then((intenet) {
    //       if (intenet) {
    //         call().then((value) => callByValue());
    //         }
    //         }));


    // else {
    //   showDialog(
    //       context: context,
    //       builder: (_) => AlertDialog(
    //         backgroundColor: Colors.black,
    //         title: Text(
    //           "No Internet Connection",
    //           style: TextStyle(color: Colors.white),
    //         ),
    //         content: Text("Please check your Internet Connection",
    //             style: TextStyle(color: Colors.white)),
    //       ));
    // }
    // }));
    //  call_value();
    super.initState();
    // print("data ${data.toString()}");
    // print("data_value ${data_value.toString()}");

    //WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: height * 1.0,
        width: width * 1.0,
        child: Column(
          children: [
            Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              // Color.fromRGBO(0, 0, 0, 1.0),
                              // Color.fromRGBO(38, 42, 45, 1.0),
                              Theme.of(context).primaryColor,
                              Theme.of(context).scaffoldBackgroundColor
                            ],
                            stops: [
                              0.1,
                              0.9
                            ])),
                    child: Container(
                      height: height * 0.35,
                      width: width * 1.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.7),
                                  BlendMode.dstATop),
                              image: ((widget.roomName.toString().replaceAll("_", " ") == "Hall"))
                                  ? AssetImage(
                                "images/room/hall.png",
                              )
                                  : ((widget.roomName.toString().replaceAll("_", " ") == "Admin Room"))
                                  ? AssetImage(
                                "images/room/admin room.jpg",
                              ) : ((widget.roomName.toString().replaceAll("_", " ") == "Garage"))
                                  ? AssetImage(
                                "images/room/garage.png",
                              )
                                  : ((widget.roomName.toString().replaceAll("_", " ") == "Kitchen"))
                                  ? AssetImage(
                                "images/room/kitchen.png",
                              )
                                  : ((widget.roomName.toString().replaceAll("_", " ") == "Bathroom1"))
                                  ? AssetImage(
                                "images/room/bathroom 1.png",
                              ): ((widget.roomName.toString().replaceAll("_", " ") == "Bathroom2"))
                                  ? AssetImage(
                                "images/room/bathroom 2.png",
                              )
                                  : ((widget.roomName.toString().replaceAll("_", " ") == "Bedroom1"))
                                  ? AssetImage(
                                "images/room/bedroom 1.png",
                              )
                                  : ((widget.roomName.toString().replaceAll("_", " ") == "Bedroom2"))
                                  ? AssetImage(
                                "images/room/bedroom 2.png",
                              )
                                  : ((widget.roomName.toString().replaceAll("_", " ") ==  "Master Bedroom"))
                                  ? AssetImage(
                                "images/room/master bedroom.png",
                              )
                                  : ((widget.roomName.toString().replaceAll("_", " ") ==  "Bedroom"))
                                  ? AssetImage(
                                "images/room/bedroom 2.png",
                              )
                                  : ((widget.roomName.toString().replaceAll("_", " ") ==  "Kids Room"))
                                  ? AssetImage(
                                "images/room/kids bedroom.png",
                              )
                                  : ((widget.roomName.toString().replaceAll("_", " ") ==  "Outside"))
                                  ? AssetImage(
                                "images/room/outside.png",
                              )
                                  : ((widget.roomName.toString().replaceAll("_", " ") ==  "Garden"))
                                  ? AssetImage(
                                "images/room/garden.png",
                              )
                                  : ((widget.roomName.toString().replaceAll("_", " ") ==  "Parking"))
                                  ? AssetImage(
                                "images/room/parking.png",
                              )
                                  : ((widget.roomName.toString().replaceAll("_", " ") ==  "Living Room"))
                                  ? AssetImage(
                                "images/room/living room.png",

                              )
                                  : ((widget.roomName.toString().replaceAll("_", " ") ==  "Store Room"))
                                  ? AssetImage(
                                "images/room/store room.png",
                              )
                                  : AssetImage(""),
                              fit: BoxFit.fill)
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back,color: Colors.white,size: height*0.030,),
                    ),
                  )
                ]
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              //height: height * 0.3724,
              height: height * 0.61489,
              width: width * 1.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 1.0),
                      Color.fromRGBO(45, 47, 49, 1.0),
                      // Theme.of(context).primaryColor,
                      // Theme.of(context).scaffoldBackgroundColor

                    ],
                    stops: [
                      0.1,
                      0.7
                    ]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.015,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.roomName.toString().replaceAll("_", " "),
                        style: GoogleFonts.robotoSlab(
                            fontSize: 24, color: Colors.white),
                      )),

                  SizedBox(
                    height: height * 0.010,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    height: height * 0.5500,
                    width: width * 1.0,
                    color: Colors.transparent,
                    // decoration: BoxDecoration(
                    //     gradient: LinearGradient(
                    //         begin: Alignment.bottomLeft,
                    //         end: Alignment.topRight,
                    //         colors: [
                    //           Color.fromRGBO(0, 0, 0, 1.0),
                    //           Color.fromRGBO(45, 47, 49, 1.0),
                    //         ],
                    //         stops: [
                    //           0.1,
                    //           0.7
                    //         ])),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          result && result2
                              ? Container(
                              padding: EdgeInsets.all(10.0),
                              // color: Colors.red,
                              child: Wrap(
                                spacing: 2.0,
                                children: _buildButtonsWithNames(),
                              ))
                              : Container(
                            child: Container(
                              margin: EdgeInsets.only(top: height * 0.4),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  CircularProgressIndicator(
                                    backgroundColor: Colors.grey[700],
                                    valueColor:
                                    new AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                  SizedBox(
                                    height: height*0.02,
                                  ),
                                  Text(" Loading.... ",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w300, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
