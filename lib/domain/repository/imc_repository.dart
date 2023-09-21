import 'package:imc_app/domain/enum/enum_peso.dart';
import 'package:imc_app/domain/model/imc.dart';

abstract class ImcRepository{


    List<Imc> getAll();
  
    Imc addImc(String name ,double weight , double height);
    void deleteImc(Imc imc);
    String getDateNow();
    double calculateImc(double weight , double height);
    StatusPeso getStatus(double imc);

}