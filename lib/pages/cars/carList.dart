import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:stand/components/appBar.dart';
import 'package:stand/components/carCard.dart';
import 'package:stand/components/searchPlate.dart';
import 'package:stand/models/car.dart';
import 'package:stand/models/user.dart';

class CarList extends StatefulWidget {
  final User _user;

  CarList(this._user);

  @override
  _CarListState createState() => _CarListState();
}

class _CarListState extends State<CarList> {
  List<Car> _cars = [];
  List<Car> _filteredCars = [];

  Future getData() async {
    Response response = await http.get(
        Uri.parse('http://10.0.2.2:8080/car-list'),
        headers: <String, String>{
          'Authorization': "Bearer " + widget._user.token,
        });
    List jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        for (Map<String, dynamic> data in jsonData) {
          Car c = Car.fromJson(data);
          _cars.add(c);
        }
      });
    }
  }

  callback(filteredCars) {
    setState(() {
      this._filteredCars = filteredCars;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    _filteredCars = _cars;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StandAppBar(widget._user.username, "Car List"),
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
          SearchPlate("car", _cars, callback),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _filteredCars == null ? 0 : _filteredCars.length,
                itemBuilder: (BuildContext context, int index) {
                  return CarCard(_filteredCars[index], widget._user);
                }),
          )
        ],
      )),
    );
  }
}
