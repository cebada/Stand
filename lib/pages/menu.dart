import 'package:flutter/material.dart';
import 'package:stand/main.dart';

class Menu extends StatefulWidget {

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
      ),
      drawer: Drawer(
        child: Text('Oi oi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Image(
                image: AssetImage('assets/logo_rocha.png'),
                height: 120,
                width: 120,
              ),
            ),
            Expanded(
                child: GridView.count(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(30),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              crossAxisCount: 2,
              children: [
                RaisedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, CarListRoute);
                  },
                  icon: Icon(Icons.directions_car_rounded),
                  label: Text('Cars'),
                  elevation: 5,
                  color: Colors.red[600],
                  textColor: Colors.white,
                ),
                RaisedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, PartsListRoute);
                  },
                  icon: Icon(Icons.build),
                  label: Text('Parts'),
                  elevation: 5,
                  color: Colors.red[600],
                  textColor: Colors.white,
                ),
                RaisedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, SalesListRoute);
                  },
                  icon: Icon(Icons.point_of_sale),
                  label: Text('Sales/History'),
                  elevation: 5,
                  color: Colors.red[600],
                  textColor: Colors.white,
                ),
                RaisedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, ClientsListRoute);
                  },
                  icon: Icon(Icons.people),
                  label: Text('Clients'),
                  //child: new Text('Clients'),
                  elevation: 5,
                  color: Colors.red[600],
                  textColor: Colors.white,
                ),
                RaisedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, SuppliersListRoute);
                  },
                  icon: Icon(Icons.contact_page,),
                  label: Flexible(child: Text('Suppliers/Partners', textAlign: TextAlign.center,)),

                  elevation: 5,
                  color: Colors.red[600],
                  textColor: Colors.white,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
