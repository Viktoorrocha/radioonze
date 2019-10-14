import 'dart:async';
import 'package:radioonze/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radioonze/MusicBloc.dart';
import 'package:radioonze/info.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:rxdart/rxdart.dart';




void main() => runApp(MaterialApp(
  home: Home(),
  debugShowCheckedModeBanner: false,
));

class Home extends StatefulWidget{
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home>{
//
//  Music bloc = Music();

  IjkMediaController controller = IjkMediaController();

<<<<<<< HEAD
=======

>>>>>>> c0312a78777a995bf96b5a8880d9812928c3c667


  String capaMPB = "https://cdn.olhares.pt/client/files/foto/big/150/1503691.jpg";
  String capaSamba = "https://i.pinimg.com/originals/66/af/f6/66aff6ec0bd8e8491a391c77c35ff978.png";
  String capaJazz = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBoaQzbwVCIzSgeas4KY-h5PVJxToCjQnr_SCDlTAABBJKbMdF";
  String capaReggaeton = "https://img.vagalume.fm/1528731816330561/bg-low";
  String capaPopRocknacional = "https://www.ultimasnoticias.inf.br/wp-content/uploads/2018/10/pop-2.jpg";

  String imageAlbum = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBoaQzbwVCIzSgeas4KY-h5PVJxToCjQnr_SCDlTAABBJKbMdF";



  var blueColor = Color(0xFF090e42);
  var redColor = Color(0xFFD50000);



  var urlAudio = "http://radio.trt11.jus.br:8000/radiotrt11";
  var urlMusic = "http://radio.trt11.jus.br:8443/api/live-info/";
  var isPlaying;
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
<<<<<<< HEAD
=======

>>>>>>> c0312a78777a995bf96b5a8880d9812928c3c667
    super.dispose();
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
                        child:
                             Text("$musicaAtual", style: TextStyle(color: Colors.white,
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
                          ),
                          SizedBox(height: 25),
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[

                                  FlatButton(
                                    onPressed: (){
                                      print("Estou diminuindo o volume");
                                    },
                                    child: Icon(Icons.remove_circle,
                                      color: Colors.white,
                                      size: 45,),
                                  ),
                                  SizedBox(height: 45,),

                                  Container(
                                      decoration: BoxDecoration(
                                        color:Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: FlatButton(
                                        onPressed:()  {
                                            setState(() {
                                                if(controller.isPlaying){
                                                  controller.pause();
                                                } else {
                                                  controller.play();
                                                  controller.setNetworkDataSource("http://radio.trt11.jus.br:8000/radiotrt11",
                                                      autoPlay: true);
                                                }
                                            });


                                        },

                                      child:Icon(
                                        controller.isPlaying ? Icons.pause : Icons.play_arrow, color: blueColor, size: 60,),

                                      )),






                                  SizedBox(height: 45,),
                                  FlatButton(
                                    onPressed: (){
                                      print("Estou aumentando o volume");
                                    },
                                    child: Icon(Icons.add_circle,
                                      color: Colors.white,
                                      size: 45,),
                                  )
                                ],
                              ),
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



  Future StartRadio() async {

    var response = await http.get(urlMusic);
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body);
      musicaAtual = jsonResponse['current']['name'];
      proximaMusica = jsonResponse['next']['name'];
      titulo = jsonResponse['currentShow'][0]['name'];

      print(musicaAtual);
      print(proximaMusica);
      print(titulo);
    }
  }

}





