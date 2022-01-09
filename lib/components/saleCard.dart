import 'package:flutter/material.dart';
import 'package:stand/models/sale.dart';

class SaleCard extends StatefulWidget {
  final Sale _sale;

  SaleCard(this._sale);

  @override
  _SaleCardState createState() => _SaleCardState();
}

class _SaleCardState extends State<SaleCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text("${widget._sale.car.plate} at ${widget._sale.date}",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                  "${widget._sale.car.brand} ${widget._sale.car.model} for ${widget._sale.car.price} € to ${widget._sale.client.name}"),
            ),
          ],
        ));
  }
}
