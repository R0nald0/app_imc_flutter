import 'package:flutter/material.dart';
import 'package:imc_app/domain/enum/enum_peso.dart';

class CardImcComponent extends StatelessWidget {
   String name  ;
   double imc  ;
   String data;
   int statusPeso;
   Color color;

   CardImcComponent({Key? key,
             required this.name,
             required this.data,
             required this.imc,
             required this.statusPeso,
             required this.color
      }):super(key: key);


StatusPeso getColor(int status){
     switch(status){
         
         case 0:{
            return StatusPeso.MUITO_BAIXO_PESO ;
         }
          case 1:{
            return StatusPeso.BAIXO_PESO;
         }
          case 2:{
            return StatusPeso.NORMAL;
         }
          case 3:{
            return StatusPeso.ACIMA_DO_PESO;
         }
         
          case 4:{
            return StatusPeso.OBESIDADE_I;
         }
        case 5:{
            return StatusPeso.OBESIDADE_II;
         }
        case 6:{
            return StatusPeso.OBESIDADE_III;
         } 

          default: return StatusPeso.NORMAL;
     }
  } 

  @override
  Widget build(BuildContext context) {
    return Card(
     
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      elevation: 10,
      color: getColor(statusPeso).color,
      child: Container(
      
        padding:const EdgeInsets.all(12),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          ),
           Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Imc:",
                style: TextStyle(
                  color: Colors.white
                ),),
                Text("$imc",
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.white
                ),),
                
              ],
          ),

                
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                 flex: 2,
                child: Text("Medido em: $data",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontStyle: FontStyle.italic
                  ),
                ),
              ),
                const SizedBox(width:40),      
              Expanded(
                flex: 1,
                child: Text(getColor(statusPeso).statusPeso,
                  style: const TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    color: Colors.white
                  ),),
              ),
            ],
          )  
      
        ]),
      ),
    ) ;
  }
}