import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:imc_app/data/model/imc_dao.dart';
import 'package:imc_app/domain/enum/enum_peso.dart';
import 'package:imc_app/my_imc_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;


void main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  var local = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(local.path);
  Hive.registerAdapter(StatusPesoAdapter());
  Hive.registerAdapter(ImcDaoAdapter());
  runApp(const MyImcApp());
}
