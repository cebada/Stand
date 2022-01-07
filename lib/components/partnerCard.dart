import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stand/models/entity.dart';
import 'package:stand/models/part.dart';

class PartnerCard extends StatefulWidget {
  final Entity _partner;

  PartnerCard(this._partner);

  @override
  _PartnerCardState createState() => _PartnerCardState();
}

class _PartnerCardState extends State<PartnerCard> {
  Entity _partner;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child:ListTile(
              title: Text("${_partner.name}",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${_partner.entityType}"),
            )
          ),
        ]));
  }

  @override
  void initState() {
    super.initState();
    this._partner = widget._partner;
  }
}
