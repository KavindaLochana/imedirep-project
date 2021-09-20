import 'package:flutter/material.dart';

import 'apiData.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Details'),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 200,
                                child: Image.network(snapshot.data[i].img_url),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text("Manufacture: " +
                                        snapshot.data[i].name.toUpperCase()),
                                  ),
                                  // Container(
                                  //   child: Text("ID: " +
                                  //       snapshot.data[i].id.toString()),
                                  // ),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text("Number of Models: " +
                                        snapshot.data[i].num_models.toString()),
                                  ),
                                  // Container(
                                  //   child: Text("Car ID: " +
                                  //       snapshot.data[i].max_car_id.toString()),
                                  // ),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text("Horse Power: " +
                                        snapshot.data[i].avg_horsepower
                                            .toStringAsFixed(2)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text("Price: " +
                                        snapshot.data[i].avg_price
                                            .toStringAsFixed(2)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );

                        // Card(
                        //   child: Image.network(snapshot.data[i].img_url),
                        // );
                        // return ListTile(
                        //   title: Text(snapshot.data[i].id.toString()),
                        //   subtitle: Text(snapshot.data[i].name),
                        //   trailing:
                        //       Text(snapshot.data[i].num_models.toString()),
                        // );
                      });
                } else
                  return Center(child: CircularProgressIndicator());
                // return Container(
                //   child: Center(
                //     child: Text('Loading..'),
                //   ),
                // );
              }),
        ),
      ),
    );
  }
}
