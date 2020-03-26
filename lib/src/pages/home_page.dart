import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:beatsapp/src/widgets/cards_view.dart';
import 'package:beatsapp/src/widgets/custom_appbar.dart';
import 'package:beatsapp/src/widgets/fondo_circular.dart';

class HomePage extends StatelessWidget {
  static final String routName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // TODO: SOLUCIONADO Fondo Circular error
          FondoCircular(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 5.0,),
                  CustomAppBar(),
                  _Header(),
                  CardsView()
                ],
              ),
            ),
          ),
          BuyButton()
        ],
      )
    );
  }
}

class BuyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Ink(
            width: size.width * 0.3,
            height: 75.0,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0))
            ),
            child: InkResponse(
              highlightShape: BoxShape.rectangle,
              containedInkWell: true,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0)),
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Buy', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
                  SizedBox(width: 5.0,),
                  Icon(FontAwesomeIcons.arrowRight,color: Colors.white,)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}


//highlightShape: BoxShape.rectangle,
//containedInkWell: true,
//borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0)),
//onTap: () {},



class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox( height: 10.0,),
          Text('Beats', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),),
          Text('By Lucas', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0),),
        ],
      ),
    );
  }
}








