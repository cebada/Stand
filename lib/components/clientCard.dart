import 'package:flutter/material.dart';
import 'package:stand/models/entity.dart';

class ClientCard extends StatefulWidget {
  final Entity _client;

  ClientCard(this._client);

  @override
  _ClientCardState createState() => _ClientCardState();
}

class _ClientCardState extends State<ClientCard> {
  Entity _client;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text("Mr(s) ${_client.name}",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    this._client = widget._client;
  }
}
