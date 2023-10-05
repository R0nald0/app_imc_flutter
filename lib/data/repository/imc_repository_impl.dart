import 'package:imc_app/data/model/imc_dao.dart';
import 'package:imc_app/data/service/abstract_service_db.dart';
import 'package:imc_app/domain/enum/enum_peso.dart';
import 'package:imc_app/domain/model/imc.dart';
import 'package:imc_app/domain/repository/imc_repository.dart';
import 'package:intl/intl.dart';

class ImcRepositoryImpl extends ImcRepository {
     final AbstractServiceDb _serviceDb;
 
   ImcRepositoryImpl(this._serviceDb);

  @override
  Imc addImc( String name ,double weight , double height) {
     final imc = calculateImc(weight,height);
     var status =getStatus(imc);
     var date = getDateNow();
  
       _serviceDb.save(
        ImcDao(name, imc, status, date)
       ) ;

     return getAll().last;
  }

  @override
  void deleteImc(int index){
         _serviceDb.delete(index);
  }

  @override
  List<Imc> getAll() {
    return  _serviceDb.findAll().map(
         (e) => Imc(e.name, e.imc, e.statusWeight, e.date)
      ).cast<Imc>().toList();
  }

  @override
  String getDateNow(){
     var date = DateTime.now();
     var format = DateFormat("dd/MM/yyyy").format(date);
     return format;
  }

  @override
  double calculateImc(double weight , double height){
      var imc = weight/( height * height);
      var result = imc * 100; 
       return result.roundToDouble() /100 ;  
  }

  @override
  StatusPeso getStatus(double imc){
          switch(imc){
         
         case < 17.0 :{
            return StatusPeso.MUITO_BAIXO_PESO ;
         }
          case >= 17.1 && <= 18.49:{
            return StatusPeso.BAIXO_PESO;
         }
          case >= 18.5 && <= 24.99:{
            return StatusPeso.NORMAL;
         }
          case >= 25.0 && <= 29.99:{
            return StatusPeso.ACIMA_DO_PESO;
         }   
          case >= 30.0 && <= 34.99:{
            return StatusPeso.OBESIDADE_I;
         }
        case >= 35.0 && <= 39.99:{
            return StatusPeso.OBESIDADE_II;
         }
        case >= 17.1  :{
            return StatusPeso.OBESIDADE_III;
         } 
          default: return StatusPeso.NORMAL;
     }
         
  }


   
}