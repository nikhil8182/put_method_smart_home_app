// import 'dart:async';
// import 'dart:convert';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:put_method/second_page.dart';
// import 'package:vibration/vibration.dart';
//
// void main(){
//   runApp(const MaterialApp(
//     home: MyApp(),
//   ));
// }
//
// bool a = true;
// List json = [];
// List lightList = [];
// List lightList1 = [];
// bool _pinned = true;
// bool _floating = false;
//
//
// Route _createRoute(String word) {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => SecondPageForButtons(word),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(0.0, 0.0);
//       const end = Offset.zero;
//       const curve = Curves.slowMiddle;
//
//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }
//
// const url = "http://192.168.1.18/";
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   AudioCache _audioCache;
//
//
//   getData() async {
//  // as data is getting on both page server will get many load
//     // so pass this data to second page
//     final response = await http.get(
//       Uri.parse(url),
//     );
//   setState(() {
//     // print('geting data on first page');
//     // print('');
//
//   var json = jsonDecode(response.body);
//
//   lightList1.clear();
//   for(int i =0; i<json.length;i++){
//    lightList1.add(json[i]["Room"]);
//   }
//   lightList = lightList1.toSet().toList();
//
//    });
//   }
//
//
//   @override
//   void initState() {
//      // json = getData();
//     _audioCache = AudioCache(
//       prefix: 'assets/sound/',
//       //fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
//       // fixedPlayer: AudioPlayer(mode: PlayerMode.LOW_LATENCY),
//     );
//     // refreshQuestions();
//     Timer.periodic(
//         const Duration(seconds: 1),
//             (Timer t) =>  getData());
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Container(
//         height: height * 1.0,
//         width: width * 1.0,
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               automaticallyImplyLeading: false,
//               // backgroundColor: Color.fromRGBO(40, 36, 36, 1.0),
//               backgroundColor: Colors.white,
//               //backgroundColor: Theme.of(context).backgroundColor,
//               collapsedHeight: height * 0.12,
//               pinned: _pinned,
//               // snap: _snap,
//               floating: _floating,
//               expandedHeight: height * 0.164,
//               flexibleSpace: Padding(
//                 padding: EdgeInsets.all(15.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "Welcome Home",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     Text(
//                       "username??",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SliverList(
//             delegate:
//             SliverChildBuilderDelegate(
//                   (BuildContext context, int index) {
//                 return Column(
//                     children: lightList.map((word){
//                       return Container(
//                         //color: Color.fromRGBO(26, 28, 30, 0.6),
//                         color: Colors.white,
//                         child: Padding(
//                           padding: EdgeInsets.all(18.0),
//                           child: GestureDetector(
//                             onTap: () {
//                               _audioCache.play('tune.mp3',volume: 0.5);
//                               Vibration.vibrate(duration: 100,amplitude: 128);
//                               print("word is $word");
//                               Navigator.of(context).push(_createRoute(word));
//                               //Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPageForButtons(word)));
//                             },
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(vertical: 10.0),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: Colors.black,
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   boxShadow: const [
//                                     BoxShadow(
//                                       color: Colors.white38,
//                                       offset: Offset(
//                                         0.0,
//                                         0.0,
//                                       ),
//                                       blurRadius: 0.0,
//                                       spreadRadius: 1.0,
//                                     ),
//                                     BoxShadow(
//                                       color: Colors.black,
//                                       offset: Offset(
//                                         2.5,
//                                         2.5,
//                                       ),
//                                       blurRadius: 5.0,
//                                       spreadRadius: 1.0,
//                                     ),
//                                   ],
//                                 ),
//                                 child: Container(
//                                   height: height * 0.20,
//                                   width: width * 0.80,
//                                   decoration: BoxDecoration(
//                                     color: Colors.black26,
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     image: DecorationImage(
//                                       fit: BoxFit.cover,
//                                       colorFilter: ColorFilter.mode(
//                                           Colors.black.withOpacity(0.7), BlendMode.dstATop),
//                                       image: word.toString().contains('Hall')
//                                           ? AssetImage(
//                                         "images/room/hall.png",
//                                       )
//                                           : word.toString().contains('Admin Room')
//                                           ? const AssetImage(
//                                         "images/room/admin room.jpg",
//                                       )
//                                           : word.toString().contains("Garage")
//                                           ? const AssetImage(
//                                         "images/room/garage.png",
//                                       )
//                                           : word.toString().contains("Kitchen")
//                                           ? const AssetImage(
//                                         "images/room/kitchen.png",
//                                       )
//                                           : word.toString().contains("Bathroom1")
//                                           ? const AssetImage(
//                                         "images/room/bathroom 1.png",
//                                       )
//                                           : word.toString().contains("Bathroom2")
//                                           ? const AssetImage(
//                                         "images/room/bathroom 2.png",
//                                       )
//                                           : word.toString().contains("Bedroom1")
//                                           ? const AssetImage(
//                                         "images/room/bedroom 1.png",
//                                       )
//                                           :word.toString().contains("Bedroom2")
//                                           ? const AssetImage(
//                                         "images/room/bedroom 2.png",
//                                       )
//                                           :word.toString().contains(
//                                           "Kids_Room")
//                                           ? const AssetImage(
//                                         "images/room/kids bedroom.png",
//                                       )
//                                           :word.toString().contains(
//                                           "Master_Bedroom")
//                                           ? const AssetImage(
//                                         "images/room/master bedroom.png",
//                                       )
//                                           : word.toString().contains(
//                                           "Bedroom")
//                                           ? const AssetImage(
//                                         "images/room/bedroom 2.png",
//                                       )
//                                           : word.toString().contains("Outside")
//                                           ? const AssetImage(
//                                         "images/room/outside.png",
//                                       )
//                                           : word.toString().contains("Garden")
//                                           ? const AssetImage(
//                                         "images/room/garden.png",
//                                       )
//                                           : word.toString().contains("Parking")
//                                           ? const AssetImage(
//                                         "images/room/parking.png",
//                                       )
//                                           :word.toString().contains("Living Room")
//                                           ? const AssetImage(
//                                         "images/room/living room.png",
//                                       )
//                                           : word.toString().contains( "Store_Room")
//                                           ? const AssetImage(
//                                         "images/room/store room.png",
//                                       )
//                                           : AssetImage(""),
//                                     ),
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 10.0,bottom: 10.0),
//                                     child: Row(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         Column(
//                                           mainAxisAlignment: MainAxisAlignment.end,
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Container(
//                                                 padding:
//                                                 const EdgeInsets.symmetric(horizontal: 4.0),
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                   MainAxisAlignment.end,
//                                                   crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                                   children: [
//                                                     Text(
//                                                       word,style: const TextStyle(color: Colors.white)
//                                                       ,
//                                                       // style: Theme.of(context)
//                                                       //     .textTheme
//                                                       //     .headline6,
//                                                       //style: TextStyle(fontSize: height * 0.025, fontWeight: FontWeight.w900,color: Colors.white),
//                                                     ),
//                                                     // Text(name[index].toString()),
//                                                   ],
//                                                 )
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );},).toList()
//                 );
//               },
//               childCount: 1,
//             ),
//           ),
//           ]
//         ),
//       )
//     );
//   }
// }
//
//
// // Column(
// // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // children: [
// // const SizedBox(
// // height: 100,
// // ),
// // Center(
// // child: ElevatedButton(
// // onPressed: (){
// // setState(() {
// // a=!a;
// // });
// // http.put(
// // Uri.parse('http://192.168.1.18/6/'),
// // headers: <String, String>{
// // 'Content-Type': 'application/json; charset=UTF-8',
// // },
// // body: jsonEncode(<String, bool>{
// // 'Device_Status': a,
// // }),
// // );
// // },
// // child: Text(a?"on":"off"))
// // ),
// //
// // Container(
// // height: 400,
// // child: SingleChildScrollView(
// // child: Column(
// // children: lightList.map((word){
// // return Container(
// // //color: Color.fromRGBO(26, 28, 30, 0.6),
// // color: Theme.of(context).backgroundColor,
// // child: Padding(
// // padding: EdgeInsets.all(18.0),
// // child: GestureDetector(
// // onTap: () {
// // // Navigator.push(
// // //     context,
// // //     MaterialPageRoute(
// // //         builder: (context) => Button(
// // //           name[index].toString(),
// // //           index,
// // //           ipAddress,
// // //           g1,
// // //         )));
// // },
// // child: Padding(
// // padding: EdgeInsets.symmetric(vertical: 10.0),
// // child: Container(
// // decoration: BoxDecoration(
// // color: Colors.black,
// // borderRadius: BorderRadius.circular(10.0),
// // boxShadow: const [
// // BoxShadow(
// // color: Colors.white38,
// // offset: Offset(
// // 0.0,
// // 0.0,
// // ),
// // blurRadius: 0.0,
// // spreadRadius: 1.0,
// // ),
// // BoxShadow(
// // color: Colors.black,
// // offset: Offset(
// // 2.5,
// // 2.5,
// // ),
// // blurRadius: 5.0,
// // spreadRadius: 1.0,
// // ),
// // ],
// // ),
// // child: Container(
// // height: height * 0.20,
// // width: width * 0.80,
// // decoration: BoxDecoration(
// // color: Colors.black26,
// // borderRadius: BorderRadius.circular(10.0),
// // image: DecorationImage(
// // fit: BoxFit.cover,
// // colorFilter: ColorFilter.mode(
// // Colors.black.withOpacity(0.7), BlendMode.dstATop),
// // image: word.toString().contains('Hall')
// // ? AssetImage(
// // "images/room/hall.png",
// // )
// //     : word.toString().contains('Admin Room')
// // ? AssetImage(
// // "images/room/admin room.jpg",
// // )
// //     : word.toString().contains("Garage")
// // ? AssetImage(
// // "images/room/garage.png",
// // )
// //     : word.toString().contains("Kitchen")
// // ? AssetImage(
// // "images/room/kitchen.png",
// // )
// //     : word.toString().contains("Bathroom1")
// // ? AssetImage(
// // "images/room/bathroom 1.png",
// // )
// //     : word.toString().contains("Bathroom2")
// // ? AssetImage(
// // "images/room/bathroom 2.png",
// // )
// //     : word.toString().contains("Bedroom1")
// // ? AssetImage(
// // "images/room/bedroom 1.png",
// // )
// //     :word.toString().contains("Bedroom2")
// // ? AssetImage(
// // "images/room/bedroom 2.png",
// // )
// //     :word.toString().contains(
// // "Kids_Room")
// // ? AssetImage(
// // "images/room/kids bedroom.png",
// // )
// //     :word.toString().contains(
// // "Master_Bedroom")
// // ? AssetImage(
// // "images/room/master bedroom.png",
// // )
// //     : word.toString().contains(
// // "Bedroom")
// // ? AssetImage(
// // "images/room/bedroom 2.png",
// // )
// //     : word.toString().contains("Outside")
// // ? AssetImage(
// // "images/room/outside.png",
// // )
// //     : word.toString().contains("Garden")
// // ? AssetImage(
// // "images/room/garden.png",
// // )
// //     : word.toString().contains("Parking")
// // ? AssetImage(
// // "images/room/parking.png",
// // )
// //     :word.toString().contains("Living Room")
// // ? AssetImage(
// // "images/room/living room.png",
// // )
// //     : word.toString().contains( "Store_Room")
// // ? AssetImage(
// // "images/room/store room.png",
// // )
// //     : AssetImage(""),
// // ),
// // ),
// // child: Padding(
// // padding: EdgeInsets.only(left: 10.0,bottom: 10.0),
// // child: Row(
// // crossAxisAlignment: CrossAxisAlignment.start,
// // mainAxisAlignment: MainAxisAlignment.start,
// // children: [
// // Column(
// // mainAxisAlignment: MainAxisAlignment.end,
// // crossAxisAlignment: CrossAxisAlignment.start,
// // children: [
// // Container(
// // padding:
// // EdgeInsets.symmetric(horizontal: 4.0),
// // child: Column(
// // mainAxisAlignment:
// // MainAxisAlignment.end,
// // crossAxisAlignment:
// // CrossAxisAlignment.start,
// // children: [
// // Text(
// // word,style: TextStyle(color: Colors.white)
// // ,
// // // style: Theme.of(context)
// // //     .textTheme
// // //     .headline6,
// // //style: TextStyle(fontSize: height * 0.025, fontWeight: FontWeight.w900,color: Colors.white),
// // ),
// // // Text(name[index].toString()),
// // ],
// // )
// // ),
// //
// // ],
// // ),
// // ],
// // ),
// // ),
// // ),
// // ),
// // ),
// // ),
// // ),
// // );},).toList()
// // ),
// // ),
// // ),
// // ],
// // ),
//
//
import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:put_method/second_page.dart';
// import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';





void main(){
  runApp(const MaterialApp(home: MyApp()));
}



class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _pinned = true;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            // backgroundColor: Color.fromRGBO(40, 36, 36, 1.0),
            //backgroundColor: Color.fromRGBO(26, 28, 30, 0.6),
            backgroundColor: Theme.of(context).backgroundColor,
            collapsedHeight: height * 0.12,
            pinned: _pinned,
            // snap: _snap,
            floating: _floating,
            expandedHeight: height * 0.164,
            flexibleSpace: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    "username?? ",
                    style: Theme.of(context).textTheme.bodyText2,),
                ],
              ),
            ),
          ),
          FirstPageListContainers(),
        ],
      ),
    );
  }
}


class FirstPageListContainers extends StatefulWidget {
  @override
  _FirstPageListContainersState createState() =>
      _FirstPageListContainersState();
}

class _FirstPageListContainersState extends State<FirstPageListContainers> {
  bool wifiNotifier = false;
  bool notifier = false;
  bool mobNotifier = false;
  bool adminStatus = false;
  bool kitchenStatus = false;
  bool hallStatus = false;
  bool bedRoomStatus = false;
  bool bedRoom1Status = false;
  bool bedRoom2Status = false;
  bool masterBedStatus = false;
  bool bathRoomStatus = false;
  bool garageStatus = false;
  bool gardenStatus = false;
  bool storeStatus = false;
  bool parkingStatus = false;
  bool livingStatus = false;
  bool outSideStatus = false;
  bool status = false;
  int statusInt = 0;
  List toggleValues = [];
  int intValue = 0;
  String ip;
  Gradient g1 = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.grey[800],
        Colors.grey[800],
      ]);
  bool currentIndex = false;
  bool valueStatus = false;
  List name = [];
  List pg = [];
  List data = [];
  List data1 = [];
  bool first;
  SharedPreferences loginData;
  var sharedDataValues;
  String userName = " ";
  String ipAddress = null;
  String ipLocal = " ";
  String onlineIp = " ";
  Timer timer;
  bool hasInternet = false;
  String username =" ";
  ConnectivityResult result = ConnectivityResult.none;
  var acount = 0;
  var dataJson;
  List<String> localDataVal = [];
  List<String> dumVariable = [];
  var count = 0;


  keyValues() async {

    //loginData = await SharedPreferences.getInstance();
    const locIp = "192.168.1.18";
    // final onIp = loginData.getString('onlineIp') ?? null;

    if(locIp != null){
      // print("ipLocal is $ipLocal");
      //print("ip loc is $locIp");
      final response = await http.get(Uri.parse("http://$locIp/")).timeout(
          const Duration(milliseconds: 500),onTimeout: (){
        data.clear();
        ipAddress = "192.168.1.18";
        initial();
        return;
      });
      //print(response.statusCode.toString());
      if(response.statusCode > 0){
        data.clear();
        ipAddress = locIp;
        // setState(() {
        //   //ignore:avoid_print
        //   //print("im inside the if $ipLocal local ip");
        //   data.clear();
        //   ipAddress = locIp;
        //   //ignore:avoid_print
        //   //print("im inside the if and the ipAddress is $ipAddress");
        // });
      }
      initial();
      //localDataVariableStorage();
    }else{
      initial();
    }

  }

  Future<void> initial() async {
    //print("im inisde the initial state of list");
    loginData = await SharedPreferences.getInstance();
    username = loginData.getString('username');
    if (ipAddress == null) {
      //print("data is null in if state of list ");
      // fireData();
    }else if((data == null) || (data.length == 0)){
      //print("sucker!!!!!!!!!!!!!!!!!!!!");
      if (ipAddress.toString() != 'false') {
        //print("im inside the else if of initial **************");
        final response = await http.get(Uri.parse("http://$ipAddress/",));
        var fetchdata = jsonDecode(response.body);
        // data = fetchdata;
        setState(() {
          localDataVal.clear();
          //data  = fetchdata;
          var dumData = fetchdata;
          for (int i = 0; i < dumData.length; i++) {
            dumVariable.add(dumData[i]["Room"].toString());
          }
          localDataVal= dumVariable.toSet().toList();
          data = localDataVal;
          //print("im local in if loop data in list $localDataVal");
          loginData.setStringList('dataValues', localDataVal);
          initial();
          // print(data);
        });
      }
    } else {
      //print("im going into the getName of list in initial ");
      getName();
    }
  }

  Future getName() async {
    //  print("im inside the getname of list funtion");
    // print("data is 8888888888888888888888888888888888 $data");
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
      } else if (data[i].toString().contains("Bathroom1") &&
          (!name.contains(data[i].toString().contains("Bathroom1")))) {
        name.add("Bathroom1");
        pg.add("Bathroom1");
      }  else if (data[i].toString().contains("Bathroom2") &&
          (!name.contains(data[i].toString().contains("Bathroom2")))) {
        name.add("Bathroom2");
        pg.add("Bathroom2");
      } else if (data[i].toString().contains("Bathroom") &&
          (!name.contains(data[i].toString().contains("Bathroom")))) {
        name.add("Bathroom");
        pg.add("Bathroom");
      }else if (data[i].toString().contains("Master Bedroom") &&
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
      }else if (data[i].toString().contains("Garden") &&
          (!name.contains(data[i].toString().contains("Garden")))) {
        name.add("Garden");
        pg.add("Garden");
      }
    }

    // name = name.toSet().toList();
    // pg = pg.toSet().toList();

    setState(() {
      name = name.toSet().toList();
      pg = pg.toSet().toList();
      //print("$name  88889978");
    });
    // print("name $name");
    // print("pg $pg");

    //return "success";
  }

  Future<void> internet() async {
    //print("the connectivity is now $result """"""""""""""""""""""""""""""""""""""""""""""""""");
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        //print("the connectivity eeeeeeeeeeeeeeeeeee  is now $result """"""""""""""""""""""""""""""""""""""""""""""""""");
        this.result = result;
      });
    });

    InternetConnectionChecker().onStatusChange.listen((status) async {
      final hasInternet = status == InternetConnectionStatus.connected;
      setState(() {
        this.hasInternet = hasInternet;
      });
    });
    hasInternet = await InternetConnectionChecker().hasConnection;
    result = await Connectivity().checkConnectivity();
  }

  @override
  void initState() {
    keyValues();
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) {
      keyValues();
      internet();
      // getName();
    });
    //initial();
    // timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
    //   wiFiChecker();
    //   // getName();
    // });

    super.initState();

    //print("url type: ${widget.check_url}");
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SliverList(
      delegate:
      SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Container(
            //color: Color.fromRGBO(26, 28, 30, 0.6),
            color: Theme.of(context).backgroundColor,
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: () {
                  // print(name[index].toString());
                  // print(index);
                  // print(ipAddress);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Button(
                            name[index].toString(),
                            index,
                            ipAddress,
                            g1,
                          ))
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white38,
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                          blurRadius: 0.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(
                            2.5,
                            2.5,
                          ),
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Container(
                      height: height * 0.20,
                      width: width * 0.80,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.7), BlendMode.dstATop),
                          image: name[index].toString().contains("Hall")
                              ? AssetImage(
                            "images/room/hall.png",
                          )
                              : name[index].toString().contains("Admin")
                              ? AssetImage(
                            "images/room/admin room.jpg",
                          )
                              : name[index].toString().contains("Garage")
                              ? AssetImage(
                            "images/room/garage.png",
                          )
                              : name[index]
                              .toString()
                              .contains("Kitchen")
                              ? AssetImage(
                            "images/room/kitchen.png",
                          )
                              : name[index]
                              .toString()
                              .contains("Bathroom1")
                              ? AssetImage(
                            "images/room/bathroom 1.png",
                          )
                              : name[index]
                              .toString()
                              .contains("Bathroom2")
                              ? AssetImage(
                            "images/room/bathroom 2.png",
                          )
                              : name[index]
                              .toString()
                              .contains("Bedroom1")
                              ? AssetImage(
                            "images/room/bedroom 1.png",
                          )
                              : name[index]
                              .toString()
                              .contains(
                              "Bedroom2")
                              ? AssetImage(
                            "images/room/bedroom 2.png",
                          )
                              : name[index]
                              .toString()
                              .contains(
                              "Kids_Room")
                              ? AssetImage(
                            "images/room/kids bedroom.png",
                          )
                              : name[index]
                              .toString()
                              .contains(
                              "Master_Bedroom")
                              ? AssetImage(
                            "images/room/master bedroom.png",
                          )
                              : name[index]
                              .toString()
                              .contains(
                              "Bedroom")
                              ? AssetImage(
                            "images/room/bedroom 2.png",
                          )
                              : name[index]
                              .toString()
                              .contains("Outside")
                              ? AssetImage(
                            "images/room/outside.png",
                          )
                              : name[index].toString().contains("Garden")
                              ? AssetImage(
                            "images/room/garden.png",
                          )
                              : name[index].toString().contains("Parking")
                              ? AssetImage(
                            "images/room/parking.png",
                          )
                              : name[index].toString().contains("Living_Room")
                              ? AssetImage(
                            "images/room/living room.png",
                          )
                              : name[index].toString().contains("Store_Room")
                              ? AssetImage(
                            "images/room/store room.png",
                          )
                              : AssetImage(""),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0,bottom: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                                  child: name[index].toString().contains("Hall")
                                      ? Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${name[index].toString().replaceAll("_", " ")}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                        //style: TextStyle(fontSize: height * 0.025, fontWeight: FontWeight.w900,color: Colors.white),
                                      ),
                                      // Text(name[index].toString()),
                                    ],
                                  )
                                      : name[index].toString().contains("Admin")
                                      ? Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${name[index].toString().replaceAll("_", " ")}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                        //style: TextStyle(color: Colors.white, fontSize: height * 0.025, fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  )
                                      : name[index]
                                      .toString()
                                      .contains("Garage")
                                      ? Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        "${name[index].toString().replaceAll("_", " ")}",
                                        style:
                                        Theme.of(context)
                                            .textTheme
                                            .headline6,
                                        // style: TextStyle(
                                        //     color:
                                        //     Colors.white,
                                        //     fontSize: height *
                                        //         0.025,
                                        //     fontWeight:
                                        //     FontWeight
                                        //         .w900),
                                      ),
                                    ],
                                  )
                                      : name[index]
                                      .toString()
                                      .contains("Kitchen")
                                      ? Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .end,
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        "${name[index].toString().replaceAll("_", " ")}",
                                        style: Theme.of(
                                            context)
                                            .textTheme
                                            .headline6,
                                        // style: TextStyle(
                                        //     color: Colors
                                        //         .white,
                                        //     fontSize:
                                        //     height *
                                        //         0.025,
                                        //     fontWeight:
                                        //     FontWeight
                                        //         .w900),
                                      ),
                                    ],
                                  )
                                      : name[index]
                                      .toString()
                                      .contains("Bathroom1")
                                      ? Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .end,
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        "${name[index].toString().replaceAll("_", " ")}",
                                        style: Theme.of(
                                            context)
                                            .textTheme
                                            .headline6,
                                        // style: TextStyle(
                                        //     color: Colors
                                        //         .white,
                                        //     fontSize:
                                        //     height *
                                        //         0.025,
                                        //     fontWeight:
                                        //     FontWeight
                                        //         .w900),
                                      ),
                                    ],
                                  )
                                      : name[index]
                                      .toString()
                                      .contains(
                                      "Bathroom2")
                                      ? Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .end,
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        "${name[index].toString().replaceAll("_", " ")}",
                                        // style: TextStyle(
                                        //     color: Colors
                                        //         .white,
                                        //     fontSize: height *
                                        //         0.025,
                                        //     fontWeight:
                                        //     FontWeight.w900),
                                        style: Theme.of(
                                            context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ],
                                  )
                                      : name[index]
                                      .toString()
                                      .contains(
                                      "Bedroom1")
                                      ? Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .end,
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        "${name[index].toString().replaceAll("_", " ")}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                        // style: TextStyle(
                                        //     color: Colors.white,
                                        //     fontSize: height * 0.025,
                                        //     fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  )
                                      : name[index]
                                      .toString()
                                      .contains(
                                      "Bedroom2")
                                      ? Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${name[index].toString().replaceAll("_", " ")}",
                                        style: Theme.of(context).textTheme.headline6,
                                        //style: TextStyle(color: Colors.white, fontSize: height * 0.025, fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  )
                                      : name[index]
                                      .toString()
                                      .contains(
                                      "Master_Bedroom")
                                      ? Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${name[index].toString().replaceAll("_", " ")}",
                                        style: Theme.of(context).textTheme.headline6,
                                        //style: TextStyle(color: Colors.white, fontSize: height * 0.025, fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  )
                                      : name[index]
                                      .toString()
                                      .contains("Bedroom")
                                      ? Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${name[index].toString().replaceAll("_", " ")}",
                                        style: Theme.of(context).textTheme.headline6,
                                        // style: TextStyle(color: Colors.white, fontSize: height * 0.025, fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  )
                                      : name[index].toString().contains("Outside")
                                      ? Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${name[index].toString().replaceAll("_", " ")}",
                                        style: Theme.of(context).textTheme.headline6,
                                        //style: TextStyle(color: Colors.white, fontSize: height * 0.025, fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  )
                                      : name[index].toString().contains("Garden")
                                      ? Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${name[index].toString().replaceAll("_", " ")}",
                                        style: Theme.of(context).textTheme.headline6,
                                        //style: TextStyle(color: Colors.white, fontSize: height * 0.025, fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  )
                                      : name[index].toString().contains("Parking")
                                      ? Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${name[index].toString().replaceAll("_", " ")}",
                                        style: Theme.of(context).textTheme.headline6,
                                        //style: TextStyle(color: Colors.white, fontSize: height * 0.025, fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  )
                                      : name[index].toString().contains("Living_Room")
                                      ? Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${name[index].toString().replaceAll("_", " ")}",
                                        style: Theme.of(context).textTheme.headline6,
                                        //style: TextStyle(color: Colors.white, fontSize: height * 0.025, fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  )
                                      : name[index].toString().contains("Store_Room")
                                      ? Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${name[index].toString().replaceAll("_", " ")}",
                                        style: Theme.of(context).textTheme.headline6,
                                        //style: TextStyle(color: Colors.white, fontSize: height * 0.025, fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  )
                                      : Container(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        childCount: name.length,
      ),
    );
  }


  showAnotherAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: Text("ok"),
      onPressed: () {
        acount =0;
        //wiFiChecker();
        Navigator.pop(context, false);
      },
    );
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      title: Text(
        "  No Internet ",
        style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold),
      ),
      content: Text(
        "please connect your device with INTERNET for app installation ",
        style: TextStyle(color: Colors.white60),
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
