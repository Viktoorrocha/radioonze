import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'dart:async';
import 'package:radioonze/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:radioonze/theme.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';


class MusicController extends BlocBase {

  String imageAlbum = "https://i.pinimg.com/originals/3b/bf/6c/3bbf6cdeff907157428570daa474e171.jpg";
  var blueColor = Color(0xFF090e42);
  var redColor = Color(0xFFD50000);



  var urlAudio = "http://radio.trt11.jus.br:8000/radiotrt11";
  var urlMusic = "http://radio.trt11.jus.br:8443/api/live-info/";

  String musicaAtual = "";
  String proximaMusica = "";
  var tempoMusicaAtual;
  var tempoMusicaSeguinte;
  var musicaAux;
  String titulo= "";



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



  var _musicaAtualController = StreamController();

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

