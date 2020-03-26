import 'package:flutter/material.dart';

import 'package:beatsapp/src/pages/home_page.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:beatsapp/src/providers/productos_provider.dart';


void main() {
  /// Modificar status bar
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark
  ));
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ProductosProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Beats app',
        initialRoute: HomePage.routName,
        routes: {
          HomePage.routName : (BuildContext context ) => HomePage()
        },
        theme: ThemeData(
          /// [splashFactory] modifica el comportamiento del splash del efecto material
          /// [InkRipple.splashFactory]
          splashFactory: InkRipple.splashFactory
        ),
      ),
    );
  }
}