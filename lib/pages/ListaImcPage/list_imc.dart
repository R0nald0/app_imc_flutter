import 'package:flutter/material.dart';
import 'package:imc_app/pages/shared/widget/card_imc_component.dart';
import 'package:imc_app/data/repository/imc_repository_impl.dart';

import 'package:imc_app/domain/model/imc.dart';
import 'package:imc_app/pages/ImcHomePage/imc_home_page.dart';

class ListImcState extends StatefulWidget {
  const ListImcState({super.key});
  @override
  State<ListImcState> createState() => _ListImcStateState();

}

class _ListImcStateState extends State<ListImcState> {
  final imcRepository = ImcRepositoryImpl();
  var listImc =const <Imc>[];

  
  void getAll(){
      setState(() {
         listImc =imcRepository.getAll();
         print( " list ${listImc.length}");
      });
  }
  
  
  @override
  void initState() {
    super.initState();
    getAll();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Imc"),
      ),
      body:Container(
         padding: const EdgeInsets.all(8),
         color: Color.fromARGB(255, 133, 124, 132),
         child:  listImc.isEmpty 
          ?const Center(child: Text("Nehum Cálculo de Imc",
                    style: TextStyle(
                      color: Colors.white,
                       fontSize: 16,
                       fontStyle: FontStyle.italic
                      ),),
               )  
         :ListView.builder(
          padding: const EdgeInsets.only(bottom: 150),
          itemCount: listImc.length,
          itemBuilder: (_,index){
             var user = listImc[index];
            
           return   Dismissible(
            onDismissed:(DismissDirection direction){
               imcRepository.deleteImc(user);
               getAll();
            } ,
            key:Key(user.name), 
            child: CardImcComponent(
            name: user.name ,
            data: user.date,
            imc: user.weight,
            statusPeso : user.statusWeight.index,
            color: Colors.green,
           ),
            );
         },),
       ),
       
       floatingActionButton: FloatingActionButton(
        onPressed: (){
           showModalBottomSheet(
             isScrollControlled: true,
             useSafeArea: true,
            context: context, 
            builder: (bc){
             return  ImcHomePage(imcRepository: imcRepository,onUpdate: getAll,);
           });
           //
        },
        child:const Icon(Icons.add),
        ),
    );
  }
}