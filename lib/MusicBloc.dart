//
//import 'package:rxdart/rxdart.dart';
//import 'dart:async';
//import 'package:radioonze/info.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'dart:async';
//import 'package:radioonze/theme.dart';
//import 'dart:convert' as convert;
//import 'package:http/http.dart' as http;
//import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
//
//
//
//
//
//class Music{
//
// String  musicaAtual = "";
// String proximaMusica = "";
// String titulo = "";
//
//// Music({this.musicaAtual, this.proximaMusica, this.titulo});
////
//// factory Music.fromJson(Map<String, dynamic> json){
////   return Music(
////     musicaAtual: json['current']['name'],
////     proximaMusica: json['next']['name'],
////     titulo: json['currentShow'][0]['name']
////   );
//// }
//
//
//  String imageAlbum = "https://www.cmuse.org/wp-content/uploads/2019/05/classical-vs-jazz-music.jpg";
//  var blueColor = Color(0xFF090e42);
//  var redColor = Color(0xFFD50000);
//
//  var urlAudio = "http://radio.trt11.jus.br:8000/radiotrt11";
//  var urlMusic = "http://radio.trt11.jus.br:8443/api/live-info/";
//
//  final StreamController<String> _streamController = StreamController<String>();
//
//  Sink<String> get input => _streamController.sink;
//  Stream get output => _streamController.stream;
//
//  Future StartRadio() async {
//
//    var response = await http.get(urlMusic);
//    if(response.statusCode == 200){
//      var jsonResponse = convert.jsonDecode(response.body);
//      musicaAtual = jsonResponse['current']['name'];
//      proximaMusica= jsonResponse['next']['name'];
//      titulo = jsonResponse['currentShow'][0]['name'];
//    }
//
//  setState(){
//
//  }
//
//  }
//
//
//
//
//  @override
//  void dispose() {
//    // TODO: implement dispose
//  }
//}
//
