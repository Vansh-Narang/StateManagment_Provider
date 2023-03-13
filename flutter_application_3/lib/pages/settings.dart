import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/settings_data.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building Settings');
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              //while pressing the purple or blue color
              //rebuilding the main page as well as settings page so we decided to use consumer here but cant use in appBar(to remember)
              builder: (context, value, child) {
                return Text(
                  'Choose color scheme for AppBar',
                  style: TextStyle(
                      color: context.watch<SettingsData>().appBarColor),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<SettingsData>().appBarColor = Colors.blue;
              },
              child: Text('Blue'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
              ),
              onPressed: () {
                context.read<SettingsData>().appBarColor = Colors.purple;
              },
              child: Text('Purple'),
            ),
          ],
        ),
      ),
    );
  }
}
