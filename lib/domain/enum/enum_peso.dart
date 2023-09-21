import 'package:flutter/material.dart';

enum StatusPeso{
    MUITO_BAIXO_PESO("Muito abaixo do peso",Color.fromRGBO(81, 2, 97, 1)),
    BAIXO_PESO("Baixo Peso",Color.fromRGBO(134, 3, 160, 1)),
    NORMAL("Normal", Color.fromRGBO(2, 122, 8, 0.781)),
    ACIMA_DO_PESO("Acima do peso",Color.fromARGB(255, 179, 71, 71)),
    OBESIDADE_I("Obesidade I",Color.fromARGB(255, 243, 62, 6)),
    OBESIDADE_II("Obesidade II",Color.fromARGB(255, 216, 5, 5)),
    OBESIDADE_III("Obesidade III",Color.fromARGB(255, 146, 6, 6));


   final String statusPeso;
    final Color color ;

     const StatusPeso(this.statusPeso,this.color);
}