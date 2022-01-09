import 'package:flutter/material.dart';

class CompanyLogo extends StatelessWidget {

  final double height;
  final double width;

  CompanyLogo(this.height, this.width);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Image(
        image: AssetImage('assets/logo_rocha.png'),
        height: height,
        width: width,
      ),
    );
  }

}