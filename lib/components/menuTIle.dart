import 'package:flutter/material.dart';
import 'package:stand/models/user.dart';

class MenuTile extends StatelessWidget {

  final String _route;
  final String _name;
  final IconData icon;
  final User _user;
  final Key key;

  MenuTile(this._route, this._name, this.icon,this._user, this.key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      key: key,
      onPressed: () {
        Navigator.pushNamed(context, _route, arguments: {"user": _user});
      },
      icon: Icon(icon),
      label: Text(_name),
      elevation: 5,
      color: Colors.red[600],
      textColor: Colors.white,
    );
  }

}