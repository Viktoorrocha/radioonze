import 'dart:async';
import 'dart:core' as prefix0;
import 'dart:core';
import 'package:radioonze/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radioonze/MusicBloc.dart';
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


    Timer timer;

  String capaMPB = "https://cdn.olhares.pt/client/files/foto/big/150/1503691.jpg";
  String Samba11 = "http://flinksampa.com.br/wp-content/uploads/2017/09/sambaaaa.jpg";
  String Jazz = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBoaQzbwVCIzSgeas4KY-h5PVJxToCjQnr_SCDlTAABBJKbMdF";
  String bailandoReggeton = "https://img.vagalume.fm/1528731816330561/bg-low";
  String capaPopRocknacional = "https://www.ultimasnoticias.inf.br/wp-content/uploads/2018/10/pop-2.jpg";
  String rockInternacional = "https://direct.rhapsody.com/imageserver/images/imgs.157617893/500x500.jpg";
  String corujao = "https://66.media.tumblr.com/tumblr_m7pde8iONC1rc7ynmo1_400.jpg";
  String manhacomDeus = "https://data.whicdn.com/images/229271067/original.jpg";
  String oMelhordoRock = "https://66.media.tumblr.com/bdd9d707ad326490b6eb6aceaa2e8acc/tumblr_p21qdtny2Z1w2njpno5_250.png";
  String miscelania = "https://www.wradio.com.co/images/3887724_n_imgg.jpg?u=607460";
  String jazzRelax = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9CxkUfifxfj9_vN1kBGI8LyFVJYXRZvHkpVMspUB6pjSjb8BA";
  String noiteJazz = "https://66.media.tumblr.com/8e6808eca38486b3be3ee2dc77c5065d/tumblr_oacgur2J0F1r7c92bo1_400.jpg";
  String flashback = "https://i.pinimg.com/originals/b7/0b/c3/b70bc32f6b8bd8e1ba39f69c78764316.jpg";
  String baladinhaSertaneja = "https://www.deville.com.br/wp-content/uploads/2018/09/baladas.jpg";
  String asMaisPedidas = "http://www.ocontadordecervejas.com.br/arquivos/uploads/2015/02/Captura-de-Tela-2015-02-17-%C3%A0s-20.34.13-300x230.png";

  String imageAlbum = "";
  var blueColor = Color(0xFF090e42);
  var redColor = Color(0xFFD50000);

  var urlAudio = "http://radio.trt11.jus.br:8000/radiotrt11";
  var urlMusic = "http://radio.trt11.jus.br:8443/api/live-info/";
  var isPlaying;
  String musicaAtual = "";
  String proximaMusica = "";
  String titulo= "";


  Album(){
    if (titulo == 'Samba 11' ){
      imageAlbum = Samba11;
    }
    else if ( titulo == 'Bailando Reggeton'){
      imageAlbum = bailandoReggeton;
    }
    else if ( titulo == 'Clássicos MPB' ) {
      imageAlbum = capaMPB;
    }
    else if (titulo == 'Pop Rock Nacional'){
      imageAlbum = capaPopRocknacional;
    }
    else if ( titulo ==  'Corujão 11'){
      imageAlbum = corujao;
    }
    else if (titulo == 'Rock  Internacional'){
      imageAlbum = rockInternacional;
    }
    else if (titulo == 'O melhor do rock internacional'){
    imageAlbum = oMelhordoRock;
    }
    else if (titulo == 'Miscelânia'){
    imageAlbum = miscelania;
    }
    else if (titulo == 'Jazz para relaxar'){
    imageAlbum = jazzRelax;
    }
    else if (titulo == 'Noite do Jazz'){
    imageAlbum = noiteJazz;
    }
    else if (titulo == 'Flashback'){
    imageAlbum = flashback;
    }
    else if (titulo == 'Baladinha sertanejo'){
    imageAlbum = baladinhaSertaneja;
    }
    else if (titulo == 'As mais pedidas'){
    imageAlbum = asMaisPedidas;
    }
  }

  @override
  void initState()  {
    StartRadio();

    Timer.periodic(Duration(seconds:5), (timer) {
      StartRadio();
      Album();
    });

  super.initState();

  }

  @override
  void dispose() {
    controller.dispose();

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
      setState(() {
        musicaAtual = jsonResponse['current']['name'];
        proximaMusica = jsonResponse['next']['name'];
        titulo = jsonResponse['currentShow'][0]['name'];
        print("ATUALIZADO!!!!");


      });
    }
  }
}





