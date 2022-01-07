import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:stand/components/saleCard.dart';
import 'dart:convert';

import 'package:stand/models/sale.dart';

class SalesList extends StatefulWidget {
  @override
  _SalesListState createState() => _SalesListState();
}

class _SalesListState extends State<SalesList> {
  List<Sale> sales = [];

  Future getData() async {
    Response response = await http.get(Uri.parse('http://10.0.2.2:8080/sales'));
    List jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        for (Map<String, dynamic> data in jsonData) {
          Sale s = Sale.fromJson(data);
          sales.add(s);
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
        title: Text('Sales History'),
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
                itemCount: sales == null ? 0 : sales.length,
                itemBuilder: (BuildContext context, int index) {
                  return SaleCard(sales[index]);
                }),
          )
        ],
      )),
    );
  }
}
