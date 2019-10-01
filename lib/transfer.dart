// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'package:radioonze/info.dart';
// import 'dart:convert' as convert;
// import 'package:http/http.dart' as http;
// import 'package:flutter_radio/flutter_radio.dart';



// void main() => runApp(MaterialApp(
//   home: Home(),
//   debugShowCheckedModeBanner: false,
// ));

// class Home extends StatefulWidget{
//   @override
//   // _HomeState createState() => new _HomeState();
// }

// class _HomeState extends State<Home>{



//   var urlAudio = "http://radio.trt11.jus.br:8000/radiotrt11";
//   var urlMusic = "http://radio.trt11.jus.br:8443/api/live-info/";




//   String musicaAtual = "";
//   String proximaMusica = "";
//   var tempoMusicaAtual;
//   var tempoMusicaSeguinte;
//   var musicaAux;



//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       audioStart();
//     });

//   }


//   Future<void> audioStart() async {
//     await FlutterRadio.audioStart();

//     var response = await http.get(urlMusic);
//     if(response.statusCode == 200){
//       var jsonResponse = convert.jsonDecode(response.body);
//       musicaAtual = jsonResponse['current']['name'];
//       proximaMusica = jsonResponse['next']['name'];

//       tempoMusicaAtual = jsonResponse['current']['starts'];
//       tempoMusicaSeguinte = jsonResponse ['next']['starts'];


//       print(tempoMusicaAtual);
//       print(tempoMusicaSeguinte);


//     }
//   }

 


//   @override
//   Widget build(BuildContext context) {

//     return new Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.red[900],
//           title: Text("Radio Onze"),
//           actions: <Widget>[
//             IconButton(icon:Icon(Icons.info,color: Colors.white, size: 40,),
//               onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Info()));
//               },)
//           ],
//         ),


//         body: SingleChildScrollView(
//           child: Padding( padding: EdgeInsets.only(top: 30),
//             child: Column(
//               children: <Widget>[
//                 Center(
//                   child: Container(
//                     width: 250.0,
//                     height: 250.0,
//                     child: Stack(
//                       children: <Widget>[
//                         Container(
//                           decoration: BoxDecoration(
//                               color: Colors.red[900].withOpacity(.5),
//                               shape: BoxShape.circle
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
                            
//                           ),
//                         ),
//                         Center(
//                           child: Container(
//                             width: 200.0,
//                             height: 200.0,
//                             child: Padding(
//                               padding: const EdgeInsets.all(3.0),
//                               child: ClipOval(
//                                 clipper: MClipper(),
//                                 child: Image.network("https://i.pinimg.com/originals/61/c3/35/61c335a0e958ae05b3d60738af3e6643.jpg",
//                                   fit: BoxFit.cover,),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25.0,
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[



//                     Text("$musicaAtual", style: TextStyle(color: Colors.red[900],fontSize: 24, fontFamily: "Nexa"),),




//                     SizedBox(height: 8.0,),

//                     Container(
//                         child: Text("Próxima Música \n", style: TextStyle(color: Colors.red[900], fontFamily: "Nexa", fontSize: 22),) ),
//                     SizedBox(height: 2,),





//                     Text(" $proximaMusica", style: TextStyle(color: Colors.red[900],fontSize: 20),

//                     )
//                   ],
//                 ),
//                 SizedBox(height: 3,),
//                 Container(
//                   width: 350.0,
//                   height: 150.0,
//                   child: Stack(
//                     children: <Widget>[
//                       Center(
//                         child: Container(
//                           height: 70,
//                           width: 290,
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: Colors.red[900], width: 3.0),
//                               borderRadius: BorderRadius.circular(40.0)),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1),
//                             child: Row(
//                               children: <Widget>[
//                                 IconButton(
//                                   onPressed: (){},
//                                   icon: Icon(Icons.volume_down,color: Colors.red[900]),
//                                   iconSize: 55,
//                                 ),
//                                 Expanded(child: Container()),


//                                 IconButton(
//                                   onPressed: (){},
//                                   icon: Icon(Icons.volume_up,color: Colors.red[900]),
//                                   iconSize: 55,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Align(
// //                      child: IconButton(
// //                        icon: Icon(Icons.play_arrow, color: Colors.white,size: 45,),
//                           alignment: Alignment.center,
//                           child: Container(
//                               width: 92,
//                               height: 92,
//                               decoration: BoxDecoration(
//                                 color: Colors.red[900],
//                                 shape: BoxShape.circle,
//                               ),
//                               child: FlatButton(
//                                 child: Icon(Icons.play_arrow, color:  Colors.white, size: 45),
//                                 onPressed: (){
//                                   setState(() {
//                                     FlutterRadio.playOrPause(url:urlAudio);

//                                   });
//                                 },

//                               ))
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 190,
//                   width: double.infinity,
//                   child: Stack(
//                     children: <Widget>[
//                       Positioned(
//                           left: -25,
//                           child:Container(
//                             width: 50.0,
//                             height: 190.0,
//                             decoration: BoxDecoration(
//                                 color: Colors.red[900],
//                                 borderRadius: BorderRadius.only(
//                                     topRight: Radius.circular(30),
//                                     bottomRight: Radius.circular(30)
//                                 )
//                             ),
//                           )
//                       ),

//                       Positioned(
//                           right: -25,
//                           child:Container(
//                             width: 50.0,
//                             height: 190.0,
//                             decoration: BoxDecoration(
//                                 color: Colors.red[900],
//                                 borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(30),
//                                     bottomLeft: Radius.circular(30)
//                                 )
//                             ),
//                           )
//                       )
//                     ],
//                   ),
//                 )

//               ],
//             ),
//           ),
//         )
//     );
//   }



// }


// class MClipper extends CustomClipper<Rect> {


//   @override
//   getClip(Size size) {
//     Rect getClip(Size size){
//       return Rect.fromCircle(
//           center: Offset(size.width/2, size.height/2),
//           radius: min(size.width, size.height) /2
//       );
//     }
//     return null;
//   }

//   @override
//   bool shouldReclip(CustomClipper oldClipper) {

//     return true;
//   }
// }


