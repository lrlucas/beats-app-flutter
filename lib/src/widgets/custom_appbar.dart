import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material( // aqui se modifico para que el efecto material no aparesca detras del fondo circular
//      width: double.infinity,
      color: Colors.transparent,
      child: Row(
        children: <Widget>[
          IconButton( icon: Icon(FontAwesomeIcons.arrowLeft, size: 17.0), onPressed: () {} ),
          Spacer(),
          IconButton( icon: Icon(FontAwesomeIcons.search, size: 15.0), onPressed: () {} ),
          Stack(
            children: <Widget>[
              IconButton( icon: Icon(FontAwesomeIcons.shoppingBag, size: 15.0), onPressed: () {} ),
              Container(
                width: 22.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20.0)
                ),
                // TODO: se podria modificar para que el numero aparesa al pie del icono como
                // TODO: en el diseño original
                child: Center(
                  child: Text('99', style: TextStyle(color: Colors.white,),),
                ),
              ),
            ],
          ),
          IconButton( icon: Icon(FontAwesomeIcons.ellipsisV, size: 15.0,), onPressed: () {} ),
          // TODO: este circulo deberia ser la foto del avatar del usuario
          // TODO: y deberia tener el efecto de material
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              width: 40.0,
              height: 40.0,
              color: Colors.blue,
            ),
          ),
          SizedBox(width: 15.0,)
        ],
      )
    );
  }
}