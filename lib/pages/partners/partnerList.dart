import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:stand/components/appBar.dart';
import 'package:stand/components/companyLogo.dart';
import 'package:stand/components/partnerCard.dart';
import 'package:stand/models/entity.dart';
import 'package:stand/models/user.dart';

class PartnerList extends StatefulWidget {
  final User _user;

  PartnerList(this._user);

  @override
  _PartnerListState createState() => _PartnerListState();
}

class _PartnerListState extends State<PartnerList> {
  List<Entity> partners = [];

  Future getData() async {
    Response response = await http.get(
        Uri.parse('http://10.0.2.2:8080/partners'),
        headers: <String, String>{
          'Authorization': "Bearer " + widget._user.token,
        });
    List jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        for (Map<String, dynamic> data in jsonData) {
          Entity partner = Entity.fromJson(data);
          partners.add(partner);
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
      appBar: StandAppBar(widget._user.username, "Partners"),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CompanyLogo(60, 60),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: partners == null ? 0 : partners.length,
                itemBuilder: (BuildContext context, int index) {
                  return PartnerCard(partners[index]);
                }),
          )
        ],
      )),
    );
  }
}
