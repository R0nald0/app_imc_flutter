import 'package:hive/hive.dart';
import 'package:imc_app/domain/enum/enum_peso.dart';

 part 'imc_dao.g.dart';

@HiveType(typeId: 0)
class ImcDao  extends HiveObject {
  @HiveField(1)
  String _name = "";
  @HiveField(2)
  double imc  = 0;
  @HiveField(3)
  Enum _statusWeight = StatusPeso.NORMAL;
  @HiveField(4)
  String _date = "12/12/2012";

  ImcDao.vazio();

  ImcDao(this._name,this.imc,this._statusWeight,this._date);
   

   String get name => _name;
   set name(name) => _name = name;

   
   double get weight => imc;
   set weight(weight) => imc = weight; 
   
   Enum get statusWeight => _statusWeight;
   set statusWeight(statusWeigh) => _statusWeight = statusWeight;

  String get date => _date;
   set date(date)=> _date = date;
}