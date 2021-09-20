import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imedirep/googleSignInProvider.dart';
import 'package:provider/provider.dart';
import './cars_details.dart';

import './apiData.dart';

class Cars extends StatefulWidget {
  Cars({Key? key}) : super(key: key);

  @override
  _CarsState createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ' + user.displayName!),
        // centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logOut();
                },
                icon: Icon(Icons.logout),
              )),
        ],
      ),
      body: Container(
        child: Card(
          child: FutureBuilder(
              future: getCarData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return Card(
                        elevation: 3,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(snapshot.data[i].name.toUpperCase()),
                            ),
                            GestureDetector(
                              child: Container(
                                height: 200,
                                child: Image.network(snapshot.data[i].img_url),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CarDetails()),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                      // return ListTile(
                      //   leading: ConstrainedBox(
                      //     constraints: BoxConstraints(
                      //       minWidth: 50,
                      //       minHeight: 50,
                      //       maxHeight: 100,
                      //       maxWidth: 100,
                      //     ),
                      //     child: Image.network(snapshot.data[i].img_url),
                      //   ),
                      //   title: Text(snapshot.data[i].name),
                      // );
                      // Card(
                      //   child: Image.network(snapshot.data[i].img_url),
                      // );
                      // return ListTile(
                      //   title: Text(snapshot.data[i].id.toString()),
                      //   subtitle: Text(snapshot.data[i].name),
                      //   trailing:
                      //       Text(snapshot.data[i].num_models.toString()),
                      // );
                    },
                  );
                } else
                  return Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
