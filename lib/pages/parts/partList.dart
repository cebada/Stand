import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:stand/components/appBar.dart';
import 'package:stand/components/companyLogo.dart';
import 'package:stand/components/partCard.dart';
import 'package:stand/models/part.dart';
import 'package:stand/models/user.dart';

class PartsList extends StatefulWidget {
  final User _user;

  PartsList(this._user);

  @override
  _PartsListState createState() => _PartsListState();
}

class _PartsListState extends State<PartsList> {
  List<Part> parts = [];

  Future getData() async {
    Response response = await http
        .get(Uri.parse('http://10.0.2.2:8080/parts'), headers: <String, String>{
      'Authorization': "Bearer " + widget._user.token,
    });
    List jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        for (Map<String, dynamic> data in jsonData) {
          Part part = Part.fromJson(data);
          parts.add(part);
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
      appBar: StandAppBar(widget._user.username, "Parts"),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CompanyLogo(60, 60),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: parts == null ? 0 : parts.length,
                itemBuilder: (BuildContext context, int index) {
                  return PartCard(parts[index]);
                }),
          )
        ],
      )),
    );
  }
}
