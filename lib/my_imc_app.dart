import 'package:flutter/material.dart';
import 'package:imc_app/pages/ListaImcPage/list_imc.dart';

class MyImcApp extends StatelessWidget {
  const MyImcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Imc",
       theme: ThemeData(
    
         appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255, 49, 240, 167)),
        useMaterial3: true
      ),
       home: const ListImcState(),
    );
  }
}