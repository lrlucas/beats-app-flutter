
//import 'package:flutter/cupertino.dart';
import 'package:beatsapp/src/models/producto_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:beatsapp/src/providers/productos_provider.dart';


class CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productosProv = Provider.of<ProductosProvider>(context);

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: PageView(
        controller: PageController(
          viewportFraction: 0.88,
        ),
        children: productosProv.productos.map((prod) => _Card(prod)).toList(),

      ),
    );
  }
}

class _Card extends StatefulWidget {

  ProductoModel prod;

  _Card(this.prod);

  @override
  __CardState createState() => __CardState();
}

class __CardState extends State<_Card> {

  GlobalKey _keyCard = GlobalKey();

  double _topSizeOfImage = 100;


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getSizes(_);
    });
    super.initState();
  }

  _getSizes(_) {
    final RenderBox renderBox = _keyCard.currentContext?.findRenderObject();
    final sizeCard = renderBox.size;
    setState(() {
      _topSizeOfImage = sizeCard.height;
    });
  }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      key: _keyCard,
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              _PrimeraDescripcion(widget.prod),
              SizedBox(
                width: size.width * 0.1,
              ),
              _TarjetaDescripcion(widget.prod)
            ],
          ),
          // TODO: Arreglar la imagen
          Positioned(
            top: _topSizeOfImage * 0.1,
            left: 30,
            child: Image(
              height: 150.0,
              image: AssetImage('assets/${widget.prod.url}'),
              width: 160.0,
            ),
          )
        ],
      ),
    );
  }
}

class _TarjetaDescripcion extends StatefulWidget {
  ProductoModel prod;
  _TarjetaDescripcion(this.prod);

  @override
  __TarjetaDescripcionState createState() => __TarjetaDescripcionState();
}

class __TarjetaDescripcionState extends State<_TarjetaDescripcion> {
  GlobalKey _keyCard = GlobalKey();
  double sizeWidthOfCard = 90.0;

  /// addPostFrameCallback se ejecuta despues que se pinta el layout
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getSizes(_);
    });
    super.initState();
  }

  _getSizes(_) {
    final RenderBox renderBox = _keyCard.currentContext?.findRenderObject();
    final sizeCard = renderBox.size;
    setState(() {
      sizeWidthOfCard = sizeCard.width;
    });
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          key: _keyCard,
          width: size.width * 0.6,
          height: 340.0,
          color: Color(widget.prod.color),
          child: Column(
            children: <Widget>[
              SizedBox(height: 25.0,),
              RotatedBox(
                quarterTurns: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
//                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      '${widget.prod.titulo}',
                      style: TextStyle(
                        color: Colors.white24,
                        fontSize: 30.0, fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      '${widget.prod.subtitulo}',
                      style: TextStyle(
                        color: Colors.white24,
                        fontSize: 30.0, fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 15.0,),
                  ],
                ),
              ),
              Spacer(),
              Padding(
//                padding: EdgeInsets.all(8.0),
                padding: EdgeInsets.fromLTRB(20.0, 0, 15.0, 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${widget.prod.nombre}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: IconButton(
                        iconSize: 23.0,
                        icon: Icon(FontAwesomeIcons.heart),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(9.0, 0.0, 0.0, 0.0),
                    width: 80.0,
                    child: Text(
                      '\$${widget.prod.precio}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  ///TODO: agregar el efecto material al boton
                  ///TODO: Solucionado
                  Container(
                    width: sizeWidthOfCard * 0.55,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0)
                      )
                    ),
                    child: Material(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                      ),
                      color: Colors.red,
                      child: InkResponse(
                        highlightShape: BoxShape.rectangle,
                        containedInkWell: true,
                        borderRadius: BorderRadius.only(
                          /// Es el encargado de recortar el efecto splash de material
                          topLeft: Radius.circular(15.0),
                        ),
                        onTap: () { },
                        child: Center(
                          child: Text(
                            'Add to bag',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
*
*
  highlightShape: BoxShape.rectangle,
  containedInkWell: true,
  borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0)),
  onTap: () {
    print("Asdasdas");
  },
*
*
*
*
* */





class _PrimeraDescripcion extends StatelessWidget {

  ProductoModel prod;
  _PrimeraDescripcion(this.prod);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: RotatedBox(
        quarterTurns: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TODO:Agregar los puntos debajo de los textos, revisar mockup
            RotatedBox(quarterTurns: 3 ,child: Icon(FontAwesomeIcons.batteryThreeQuarters, size: 15.0,)),
            SizedBox( width: 7.0,),
            Text('${prod.bateria}-Hour Battery', style: TextStyle(fontSize: 12.0),),

            SizedBox( width: 20.0,),

            Icon(FontAwesomeIcons.wifi, size: 15.0,),
            SizedBox( width: 15.0,),
            Text('Wireless', style: TextStyle(fontSize: 12.0),),

          ],
        ),
      ),
    );
  }
}


