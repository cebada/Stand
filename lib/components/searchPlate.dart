import 'package:flutter/material.dart';
import 'package:stand/models/car.dart';
import 'package:stand/models/sale.dart';

class SearchPlate extends StatefulWidget {

  final String _filter;
  final List<dynamic> _list;
  final Function (List<dynamic>) _callback;

  SearchPlate(this._filter, this._list, this._callback);

  @override
  _SearchPlateState createState() => _SearchPlateState();

}

class _SearchPlateState extends State<SearchPlate> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: TextField(
        onChanged: (value) => widget._filter == "car" ? _runFilterCar(value) : _runFilterSale(value),
        decoration: const InputDecoration(
            labelText: 'Search license plate',
            suffixIcon: Icon(Icons.search)),
      ),
    );
  }


  void _runFilterCar(String keyword) {
    List<Car> results = [];
    results = keyword.isEmpty
        ? widget._list
        : widget._list
        .where((c) => c.plate.toLowerCase().contains(keyword.toLowerCase()))
        .toList();

    widget._callback(results);
  }

  void _runFilterSale(String keyword) {
    List<Sale> results = [];
    results = keyword.isEmpty
        ? widget._list
        : widget._list
        .where((s) => s.car.plate.toLowerCase().contains(keyword.toLowerCase()))
        .toList();

    widget._callback(results);
  }
}