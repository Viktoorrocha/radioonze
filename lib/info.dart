import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var blueColor = Color(0xFF090e42);
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações"),
        backgroundColor: blueColor,
      ),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 15),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text("Informações", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ),),

          Padding(padding: EdgeInsets.only(top: 15),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text("Este aplicativo foi desenvolvido pela Secretaria de Tecnologia da Informação"
                  "e Comunicação (SETIC) do Tribunal Regional do Trabalho da 11ª Região", style: TextStyle(fontSize: 22),textAlign: TextAlign.justify,),
            ),),

          Padding(padding: EdgeInsets.only(top: 45),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text("Versão 1.0 publicada em 26/09/2019"
                , style: TextStyle(fontSize: 20),textAlign: TextAlign.justify,),
            ),)
        ] ,
      ),




    );

  }
}

