import 'package:flutter/material.dart';
import 'package:stand/models/entity.dart';

class PartnerCard extends StatefulWidget {
  final Entity _partner;

  PartnerCard(this._partner);

  @override
  _PartnerCardState createState() => _PartnerCardState();
}

class _PartnerCardState extends State<PartnerCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child:ListTile(
              title: Text("${widget._partner.name}",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${widget._partner.entityType}"),
            )
          ),
        ]));
  }
}
