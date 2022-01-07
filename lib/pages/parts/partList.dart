import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:stand/components/partCard.dart';
import 'dart:convert';

import 'package:stand/models/part.dart';


class PartsList extends StatefulWidget {
  @override
  _PartsListState createState() => _PartsListState();
}

class _PartsListState extends State<PartsList> {
  List<Part> parts = [];

  Future getData() async {
    Response response = await http.get(Uri.parse('http://10.0.2.2:8080/parts'));
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
      appBar: AppBar(
        title: Text('Parts'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Image(
              image: AssetImage('assets/logo_rocha.png'),
              height: 60,
              width: 60,
            ),
          ),
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
