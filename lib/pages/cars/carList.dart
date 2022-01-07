import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:stand/components/carCard.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:stand/models/car.dart';

class CarList extends StatefulWidget {
  @override
  _CarListState createState() => _CarListState();
}

class _CarListState extends State<CarList> {
  List<Car> cars = [];

  Future getData() async {
    Response response = await http.get(Uri.parse('http://10.0.2.2:8080/car-list'));
    List jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        for (Map<String, dynamic> data in jsonData) {
          Car c = Car.fromJson(data);
          cars.add(c);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car List'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Image(
              image: AssetImage('assets/logo_rocha.png'),
              height: 60,
              width: 60,
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: cars == null ? 0 : cars.length,
                itemBuilder: (BuildContext context, int index) {
                  return CarCard(cars[index]);
                }),
          )
        ],
      )),
    );
  }
}
