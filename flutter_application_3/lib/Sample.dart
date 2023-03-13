import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Building Main Screen");
    return ChangeNotifierProvider(
      create: (context) => AppData(), //instance of class(means the object)
      builder: (context, child) {
        //cannot return the scaffold from the child therefore returning using the builder class
        return Scaffold(
          appBar: AppBar(title: Consumer<AppData>(
            builder: (context, value, child) {
              return Text(value.name);
            },
          )),
          body: SecondScreen(),
        );
      },
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Building Second Screen");
    return Screen3();
  }
}

//not working under widget context.watch<AppData>().name
// it was changing the whole interface or building the page again so we use consumer class
// same as setstate change or build the ui thus again increasing the complexity
class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    print("Building third screen");
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Consumer<AppData>(
          builder: (context, value, child) {
            return Text(value.name);
          },
        ),
        ElevatedButton(
            onPressed: () {
              context.read<AppData>().changeData('Ansh'); //changed data
            },
            child: Text("Change data")),
      ]),
    );
  }
}

class AppData with ChangeNotifier {
  String _name = "Vansh"; //original data

  void changeData(String data) {
    _name = data;
    notifyListeners();
  }

  String get name => _name;
}
