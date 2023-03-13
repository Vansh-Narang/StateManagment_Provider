import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/settings_data.dart';
import 'package:flutter_application_3/models/user.dart';
import 'package:flutter_application_3/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building MyApp');
    return MultiProvider(
      providers: [
        //provider is must in multiprovider
        //use model classes
        ChangeNotifierProvider(create: (context) => SettingsData()),
        ChangeNotifierProvider(create: (context) => User()),
      ],
      builder: (context, child) {
        return MaterialApp(
          //returning main in builder is a good practcie
          initialRoute: RouteManager.loginPage,
          onGenerateRoute: RouteManager.generateRoute,
        );
      },
    );
  }
}
