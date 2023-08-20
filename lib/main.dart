import 'package:app_validator_nit_dpi/pages/FormDPI.dart';
import 'package:app_validator_nit_dpi/pages/FormNit.dart';
import 'package:app_validator_nit_dpi/pages/menu.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "menu",
      routes: {
        'menu' : (context) => const Menu(),
        'form_nit' : (context) => FormNIT(),
        'form_dpi' : (context) => FormDPI(),
      },
    );
  }
}
