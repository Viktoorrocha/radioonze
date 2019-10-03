import 'dart:async';
import 'package:radioonze/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radioonze/info.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';




void main() => runApp(MaterialApp(
  home: Home(),
  debugShowCheckedModeBanner: false,
));

class Home extends StatefulWidget{
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home>{

  IjkMediaController controller = IjkMediaController();


  String imageAlbum = "https://i.ytimg.com/vi/L7GvLxO4Wj8/hqdefault.jpg";
  var blueColor = Color(0xFF090e42);
  var redColor = Color(0xFFD50000);



//  var urlAudio = "http://radio.trt11.jus.br:8000/radiotrt11";
  var urlMusic = "http://radio.trt11.jus.br:8443/api/live-info/";

  String musicaAtual = "";
  String proximaMusica = "";
  var tempoMusicaAtual;
  var tempoMusicaSeguinte;
  var musicaAux;
  String titulo= "";


  @override
  void initState()  {

  super.initState();
     StartRadio();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }






  Future StartRadio() async {


    var response = await http.get(urlMusic);
    if(response.statusCode == 200){
    var jsonResponse = convert.jsonDecode(response.body);
      musicaAtual = jsonResponse['current']['name'];
      proximaMusica = jsonResponse['next']['name'];
     tempoMusicaAtual = jsonResponse['current']['starts'];
     tempoMusicaSeguinte = jsonResponse ['next']['starts'];
     titulo = jsonResponse['currentShow'][0]['name'];

     print(titulo);


    }

  }





  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      backgroundColor: blueColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Radio Onze"),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.info,color: Colors.white, size: 40,),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Info()));
            },)
        ],
      ),


      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 500.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 500.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imageAlbum), fit: BoxFit.cover)),
                  ),
                  Container(
                    height: 500.0,
                    decoration: BoxDecoration(
                        gradient:
                        LinearGradient(colors: [blueColor.withOpacity(0.2), blueColor],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)
                    ),

                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,),
                      Text('$titulo',
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                      Spacer(),
                      Center(
                        child: Text("$musicaAtual", style: TextStyle(color: Colors.white,
                            fontSize: 22),),
                      ),
                      SizedBox(height:15,),

                      Center(child: Text("Proxima Música \n", style: TextStyle(color: Colors.white,fontSize: 18),)),

                      Center(child: Text("$proximaMusica", style: TextStyle(color: Colors.white,fontSize: 18),)),
                      SizedBox(
                          height: 10
                      ),
//                      Slider(value: 0.2,
//                        onChanged: (double value){},
//                        activeColor: redColor,),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: <Widget>[
//                                Text(
//                                  '2:10',
//                                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
//                                ),
//                                Text('-03:56',
//                                    style: TextStyle(color: Colors.white.withOpacity(0.7))),
//
//
//                              ],
//                            ),
                          ),
                          SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.volume_down,
                                color: Colors.white,
                                size: 45,),
                              SizedBox(height: 32,),

                              Container(
                                  decoration: BoxDecoration(
                                    color:Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: FlatButton(
                                    onPressed:()  {
                                        setState(() async {
                                            if(controller.isPlaying){
                                              controller.pause();
                                            } else {
                                              controller.play();
                                               controller.setNetworkDataSource("http://radio.trt11.jus.br:8000/radiotrt11",
                                                  autoPlay: true);
                                            }
                                        });
                                    },

                                  child: Icon(
                                    controller.isPlaying ? Icons.pause : Icons.play_arrow, color: blueColor, size: 60,),

                                  )),






                              SizedBox(height: 32,),
                              Icon(Icons.volume_up,
                                color: Colors.white,
                                size: 45,)
                            ],
                          ),

                        ],
                      )
                    ],

                  ),
                ],
              ),


            )
          ],
        ),
      ),
    );
  }
}





