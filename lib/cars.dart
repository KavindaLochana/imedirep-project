import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imedirep/googleSignIn/googleSignInProvider.dart';
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
        backgroundColor: Colors.teal,
        //user name
        //title: Text('Welcome ' + user.displayName!),
        title: Text('Please select your car'),
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
                        color: Colors.grey[200],
                        elevation: 3,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                snapshot.data[i].name.toUpperCase(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            GestureDetector(
                              child: Container(
                                margin: EdgeInsets.all(5.0),
                                height: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://images.pexels.com/photos/116675/pexels-photo-116675.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260')),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                //child: Image.network(snapshot.data[i].img_url),
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
                    },
                  );
                } else
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.teal,
                  ));
              }),
        ),
      ),
    );
  }
}
