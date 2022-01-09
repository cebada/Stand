import 'package:flutter/material.dart';
import 'routes.dart';


void main() {
  runApp(Stand());
}

class Stand extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stand',
      theme: ThemeData(
        primaryColor: Colors.red[600]
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LoginRoute,
      onGenerateRoute: Routes.router(),
    );
  }



}

