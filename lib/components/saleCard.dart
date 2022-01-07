import 'package:flutter/material.dart';
import 'package:stand/main.dart';
import 'package:stand/models/car.dart';
import 'package:stand/models/sale.dart';

class SaleCard extends StatefulWidget {
  final Sale _sale;

  SaleCard(this._sale);

  @override
  _SaleCardState createState() => _SaleCardState();
}

class _SaleCardState extends State<SaleCard> {
  Sale _sale;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text("${_sale.car.plate} at ${_sale.date}",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                  "${_sale.car.brand} ${_sale.car.model} for ${_sale.car.price} € to ${_sale.client.name}"),
            ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    this._sale = widget._sale;
  }
}
