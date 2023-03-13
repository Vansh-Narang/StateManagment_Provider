import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/settings_data.dart';
import 'package:flutter_application_3/models/user.dart';
import 'package:flutter_application_3/routes/routes.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building MainPage');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.watch<SettingsData>().appBarColor,
        automaticallyImplyLeading: false,
        title: Text('Main Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteManager.settingsPage);
            },
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Consumer<User>(
            builder: (context, value, child) {
              return Text(
                'Welcome ${value.username}',
                style: TextStyle(fontSize: 24),
              );
            },
          ),
        ]),
      ),
    );
  }
}
