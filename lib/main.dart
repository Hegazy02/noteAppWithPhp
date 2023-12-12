import 'package:flutter/material.dart';
import 'package:noteappwithphp/core/routing/routes.dart';
import 'package:noteappwithphp/core/utils/service_locator.dart';
import 'package:noteappwithphp/core/utils/sqlflite.dart';
import 'package:noteappwithphp/noteappwithphp_app.dart';

void main() async {
  WidgetsFlutterBinding();
  ServiceLocator.setup();
  await SqlDb().initialDb();

  runApp(NoteappwithphpApp(
    initialRoute: await login(),
  ));
}

Future<String> login() async {
  List test = await SqlDb().getData("SELECT `isLogined` FROM `user`");
  print("ccc ${test} : true = 1 , false = 0");
  if (test.isEmpty || test[0]['isLogined'] == 0) {
    return Routes.loginView;
  } else {
    return Routes.homeView;
  }
}
