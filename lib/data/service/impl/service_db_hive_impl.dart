import 'package:hive/hive.dart';
import 'package:imc_app/data/model/imc_dao.dart';
import 'package:imc_app/data/service/abstract_service_db.dart';

class ServiceDbHiveImpl extends AbstractServiceDb {

 static late Box _box ;
 static const BOX_NAME ="imc_app";

 ServiceDbHiveImpl._vazio();

 static Future<ServiceDbHiveImpl> initBox() async{
     if(Hive.isBoxOpen(BOX_NAME)){
       _box = Hive.box(BOX_NAME);
     }else{
       _box = await Hive.openBox(BOX_NAME);
     }
     return ServiceDbHiveImpl._vazio();
  }

  

  @override
  void delete(int index) async{
       await _box.deleteAt(index);
  }

  @override
  List<ImcDao> findAll() {
       return  _box.values.cast<ImcDao>().toList();
  }

  @override
  Future<int> save(ImcDao imc) async {
    return  await _box.add(imc);
  }
   
 }