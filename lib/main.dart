import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:imedirep/googleSignInProvider.dart';
import 'package:provider/provider.dart';

import 'cars.dart';

import 'googleSignInPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DataFromAPI(),
        ),
      );
}

class DataFromAPI extends StatefulWidget {
  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return Cars();
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Something Went Wrong!'),
          );
        } else {
          return SafeArea(child: SiginInPage());
        }
      },
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