import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_references/settings.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int col = Colors.white.value;
  Future<void> getDate() async {
    final SharedPreferences prf = await _prefs;
    setState(() {
      col = prf.getInt('fev') ?? Colors.white.value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDate();
  }

  @override
  Widget build(BuildContext context) {
    getDate();
    return Scaffold(
      backgroundColor: Color(col),
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Settings()));
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Home Page',
          style: TextStyle(
            fontSize: 25,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
