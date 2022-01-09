import 'package:flutter/material.dart';
import 'package:stand/models/entity.dart';

class ClientCard extends StatefulWidget {
  final Entity _client;

  ClientCard(this._client);

  @override
  _ClientCardState createState() => _ClientCardState();
}

class _ClientCardState extends State<ClientCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text("Mr(s) ${widget._client.name}",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ));
  }
}
