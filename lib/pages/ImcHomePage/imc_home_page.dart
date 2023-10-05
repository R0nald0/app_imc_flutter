

import 'package:flutter/material.dart';
import 'package:imc_app/domain/model/imc.dart';
import 'package:imc_app/domain/repository/imc_repository.dart';

class ImcHomePage extends StatefulWidget {
  final ImcRepository imcRepository;
  final Function onUpdate;

  const ImcHomePage({super.key,required this.imcRepository,required this.onUpdate});
  @override
  State<ImcHomePage> createState() => _ImcHomePageState();
}

class _ImcHomePageState extends State<ImcHomePage> {
  

  final nameController = TextEditingController();
  final alturaController = TextEditingController();
  final pesoController = TextEditingController();

  late Imc imc ;
  
 void calcularImc(ImcRepository imcRepo){
       double? weight = double.tryParse(pesoController.text);
       double? height = double.tryParse(alturaController.text) ;

        if (weight !=null && height != null) {
          imc =  imcRepo.addImc(nameController.text, weight, height);  
        }
        
 }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        
        child: Container(
           height: MediaQuery.of(context).size.height /1.3 ,
          
          child:  Column(children: [
            const SizedBox(height: 20,),
            const Text("Dados para calcular IMC",
                         style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 23
                         ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          label: Text("Nome"),
                          hintText: "Digite Seu Nome... "
                        ),
                      ),
          
                       TextField(
                        controller: alturaController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text("Altura"),
                          hintText: "Digite Sua Altura... Ex: 1.70"
                        ),
                      ),
          
                        TextField(
                        controller:pesoController ,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text("Peso"),
                          hintText: "Digite Seu peso... Ex: 70.0"
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                 
                OutlinedButton(
                  onPressed:(){
                      if(nameController.text.isNotEmpty && 
                      alturaController.text.isNotEmpty && 
                      pesoController.text.isNotEmpty
                      ){
                         widget.onUpdate();
                        calcularImc(widget.imcRepository);
                        Navigator.pop(context);
                        showAlertDialog(context,nameController.text);
                      } else{
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Preencha os dados corretamente"),
                              
                            )
                        );
                      }  
                  } , 
                  child: const Text("Calcular")
                  )   
          ],),
        ),
      ) ;

  }

  Future<dynamic> showAlertDialog(BuildContext context ,String name) {
    return showDialog(
                  context: context, 
                  builder: (BuildContext context){
                     return  AlertDialog(
                       title:  Center(child: Text("Calculo IMC $name")),
                       content: Wrap(
                         children: [
                           Center(
                             child: Text("${imc.imc}",
                              style: const TextStyle(
                              fontSize: 30,
                              ),
                             ),
                           ),
                         ]
                       ),
                       actions: [
                          TextButton(
                            onPressed:(){
                              Navigator.pop(context);
                            }, 
                            child: const Text("Ok"),
                            ),
                       ],
                     );
                   }
         );
  }
}
