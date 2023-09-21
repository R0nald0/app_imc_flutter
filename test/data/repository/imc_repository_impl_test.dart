import 'package:flutter_test/flutter_test.dart';
import 'package:imc_app/data/repository/imc_repository_impl.dart';
import 'package:imc_app/domain/enum/enum_peso.dart';


void main() {

  
final imcRepository = ImcRepositoryImpl();
  test("addImc() should save imc ", () => {
       expect(
        imcRepository.addImc("teste",23.4,1.98).statusWeight
        ,StatusPeso.MUITO_BAIXO_PESO),
        expect(
        imcRepository.addImc("bob",80.0,1.98).statusWeight
        ,StatusPeso.NORMAL),
        expect(
        imcRepository.addImc("tuth",70.4,1.56).statusWeight
        ,StatusPeso.ACIMA_DO_PESO),
        
  });

  test("getAll() should retun a list of Imc", () => {
     expect(imcRepository.getAll().length, 6)
  });

test("calculateImc() should retun calculo of the imc", () => {
      expect(imcRepository.calculateImc(80.0, 1.80),24.69)
});

test("getStatus() should return staus of imc", () => {
    expect(imcRepository.getStatus(24.60),StatusPeso.NORMAL)
});

}