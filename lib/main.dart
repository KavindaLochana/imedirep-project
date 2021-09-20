import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'cars.dart';

import 'googleSignInPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DataFromAPI(),
    );
  }
}

class DataFromAPI extends StatefulWidget {
  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SiginInPage(),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Car Data'),
    //   ),
    //   body: SiginInPage(),
    //   //body: Cars(),
    // );
  }
}

//git testing