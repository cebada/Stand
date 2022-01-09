import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:stand/components/appBar.dart';
import 'package:stand/components/clientCard.dart';
import 'package:stand/components/companyLogo.dart';
import 'package:stand/models/entity.dart';
import 'package:stand/models/user.dart';

class ClientsList extends StatefulWidget {
  final User _user;

  ClientsList(this._user);

  @override
  _ClientsListState createState() => _ClientsListState();
}

class _ClientsListState extends State<ClientsList> {
  List<Entity> clients = [];

  Future getData() async {
    Response response = await http.get(
        Uri.parse('http://10.0.2.2:8080/clients'),
        headers: <String, String>{
          'Authorization': "Bearer " + widget._user.token,
        });
    List jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        for (Map<String, dynamic> data in jsonData) {
          Entity client = Entity.fromJson(data);
          clients.add(client);
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
      appBar: StandAppBar(widget._user.username, "Clients"),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CompanyLogo(60, 60),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: clients == null ? 0 : clients.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClientCard(clients[index]);
                }),
          )
        ],
      )),
    );
  }
}
