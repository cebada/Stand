import 'package:flutter/material.dart';
import 'package:stand/components/appBar.dart';
import 'package:stand/components/companyLogo.dart';
import 'package:stand/components/menuTIle.dart';
import 'package:stand/main.dart';
import 'package:stand/models/user.dart';
import 'package:stand/routes.dart';

class Menu extends StatefulWidget {
  final User _user;

  Menu(this._user);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StandAppBar(widget._user.username, "Main Menu"),
      drawer: Drawer(
        child: Text('Oi oi'), //TODO finish drawer
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CompanyLogo(120, 120),
            Expanded(
                child: GridView.count(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(30),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              crossAxisCount: 2,
              children: [
                MenuTile(Routes.CarListRoute, 'Cars', Icons.directions_car_rounded, widget._user),
                MenuTile(Routes.PartsListRoute, 'Parts', Icons.build, widget._user),
                MenuTile(Routes.SalesListRoute, 'Sales/History', Icons.point_of_sale, widget._user),
                MenuTile(Routes.ClientsListRoute, 'Clients', Icons.people, widget._user),
                MenuTile(Routes.SuppliersListRoute, 'Partners', Icons.contact_page, widget._user),
              ],
            )),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
