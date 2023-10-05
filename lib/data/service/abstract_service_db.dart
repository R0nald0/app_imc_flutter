import 'package:imc_app/data/model/imc_dao.dart';

abstract class AbstractServiceDb {
   
     Future<int> save(ImcDao imc);
     List<ImcDao> findAll();
     void delete(int index);
}