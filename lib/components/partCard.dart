import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stand/models/part.dart';

class PartCard extends StatefulWidget {
  final Part _part;

  PartCard(this._part);

  @override
  _PartCardState createState() => _PartCardState();
}

class _PartCardState extends State<PartCard> {
  Part _part;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${_part.name}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Cost: ${_part.cost} €")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Bought at: ${_part.purchaseDate}"),
                Text("From:  ${_part.supplier}")
              ],
            ),
          ),
        ]));
  }

  @override
  void initState() {
    super.initState();
    this._part = widget._part;
  }
}
