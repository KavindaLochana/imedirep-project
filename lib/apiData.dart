import 'dart:convert';

import 'package:http/http.dart' as http;

//making a function to get data from API
Future getCarData() async {
  var response = await http.get(Uri.https(
      'private-anon-b242a842d4-carsapi1.apiary-mock.com', 'manufacturers'));

  var jsonData = jsonDecode(response.body);
  List<Manufacture> manufacturers = []; //this list is for api json data

  for (var u in jsonData) {
    Manufacture manufacture = Manufacture(
      u['id'],
      u['name'],
      u['img_url'],
      u['avg_price'],
      u['avg_horsepower'],
      u['max_car_id'],
      u['num_models'],
    );
    manufacturers.add(manufacture); // adding data to list
  }
  print(manufacturers.length); //printing data list length
  return manufacturers;
}

//this is for data we will getting
class Manufacture {
  // ignore: non_constant_identifier_names
  final String name, img_url;
  // ignore: non_constant_identifier_names
  final int id, max_car_id, num_models;

  // ignore: non_constant_identifier_names
  final double avg_price, avg_horsepower;

  Manufacture(
    this.id,
    this.name,
    this.img_url,
    this.avg_price,
    this.avg_horsepower,
    this.max_car_id,
    this.num_models,
  );
}
