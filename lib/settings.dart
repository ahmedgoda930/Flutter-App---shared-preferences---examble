import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late Future<int> fevcolor;
  int col = Colors.white.value;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  saveDate(int color) async {
    final SharedPreferences prf = await _prefs;
    fevcolor = prf.setInt("fev", col).then((bool success) {
      print('sucess');
      return fevcolor;
    });
  }

  Future<void> getDate() async {
    final SharedPreferences prf = await _prefs;
    setState(() {
      col = prf.getInt('fev') ?? Colors.white.value;
    });
  }

  @override
  void initState() {
    super.initState();
    getDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(col),
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: [
            RadioListTile(
              title: Text(
                'Green',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: Colors.green.value,
              groupValue: col,
              onChanged: (onChanged) {
                setState(() {
                  col = onChanged as int;
                });
                saveDate(onChanged as int);
              },
            ),
            RadioListTile(
              title: Text(
                'Blue',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: Colors.blue.value,
              groupValue: col,
              onChanged: (onChanged) {
                setState(() {
                  col = onChanged as int;
                });
                saveDate(onChanged as int);
              },
            ),
            RadioListTile(
              title: Text(
                'Pink',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: Colors.pink.value,
              groupValue: col,
              onChanged: (onChanged) {
                setState(() {
                  col = onChanged as int;
                });
                saveDate(onChanged as int);
              },
            ),
            RadioListTile(
              title: Text(
                'Red',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: Colors.red.value,
              groupValue: col,
              onChanged: (onChanged) {
                setState(() {
                  col = onChanged as int;
                });
                saveDate(onChanged as int);
              },
            ),
            RadioListTile(
              title: Text(
                'Indigo',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: Colors.indigo.value,
              groupValue: col,
              onChanged: (onChanged) {
                setState(() {
                  col = onChanged as int;
                });
                saveDate(onChanged as int);
              },
            ),
          ],
        ),
      ),
    );
  }
}
