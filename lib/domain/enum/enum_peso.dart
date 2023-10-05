import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

 part 'enum_peso.g.dart';

@HiveType(typeId: 1)
enum StatusPeso{
    @HiveField(1)
    MUITO_BAIXO_PESO("Muito abaixo do peso",Color.fromRGBO(81, 2, 97, 1)),
    @HiveField(2)
    BAIXO_PESO("Baixo Peso",Color.fromRGBO(134, 3, 160, 1)),
     @HiveField(3)
    NORMAL("Normal", Color.fromRGBO(2, 122, 8, 0.781)),
     @HiveField(4)
    ACIMA_DO_PESO("Acima do peso",Color.fromARGB(255, 179, 71, 71)),
    @HiveField(5)
    OBESIDADE_I("Obesidade I",Color.fromARGB(255, 243, 62, 6)),
    @HiveField(6)
    OBESIDADE_II("Obesidade II",Color.fromARGB(255, 216, 5, 5)),
     @HiveField(7)
    OBESIDADE_III("Obesidade III",Color.fromARGB(255, 146, 6, 6));


   final String statusPeso;
    final Color color ;

     const StatusPeso(this.statusPeso,this.color);
}