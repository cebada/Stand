import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:stand/components/appBar.dart';
import 'package:stand/components/companyLogo.dart';
import 'package:stand/components/saleCard.dart';
import 'package:stand/components/searchPlate.dart';
import 'package:stand/models/sale.dart';
import 'package:stand/models/user.dart';

class SalesList extends StatefulWidget {
  final User _user;

  SalesList(this._user);

  @override
  _SalesListState createState() => _SalesListState();
}

class _SalesListState extends State<SalesList> {
  List<Sale> _sales = [];
  List<Sale> _filteredSales = [];

  Future getData() async {
    Response response = await http
        .get(Uri.parse('http://10.0.2.2:8080/sales'), headers: <String, String>{
      'Authorization': "Bearer " + widget._user.token,
    });
    List jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        for (Map<String, dynamic> data in jsonData) {
          Sale s = Sale.fromJson(data);
          _sales.add(s);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    _filteredSales = _sales;
  }

  callback(filteredSales) {
    setState(() {
      this._filteredSales = filteredSales;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StandAppBar(widget._user.username, "Sales History"),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CompanyLogo(60, 60),
          SearchPlate("sale", _sales, callback),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _filteredSales == null ? 0 : _filteredSales.length,
                itemBuilder: (BuildContext context, int index) {
                  return SaleCard(_filteredSales[index]);
                }),
          )
        ],
      )),
    );
  }
}
