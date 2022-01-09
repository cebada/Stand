import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:stand/components/companyLogo.dart';
import 'package:stand/models/user.dart';

import '../../routes.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  User user = new User();

  Future<void> validate() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await login();
      if (user.token != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.MenuRoute, (route) => false,
            arguments: {"user": user});
      } else {
        print("Wrong Credentials!");
        createAlertDialog(
            context,
            "Wrong Credentials",
            Icon(
              Icons.report_problem_outlined,
              color: Colors.redAccent,
              size: 72.0,
            ));
      }
    }
  }

  createAlertDialog(BuildContext context, String message, Icon icon) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Text(message), content: icon, actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Ok"),
            ),
          ]);
        });
  }

  Future login() async {
    final http.Response response = await http.post(
        Uri.parse('http://10.0.2.2:8080/login'),
        body: jsonEncode(<String, String>{
          'username': user.username,
          'password': user.password
        }),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      setState(() {
        var receivedJson = jsonDecode(response.body);
        user.token = receivedJson['token'];
        user.password = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Login"),
          backgroundColor: Colors.red[600],
        ),
        body: Column(
            children: [
              CompanyLogo(120, 120),
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Center(
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Username"),
                          validator: RequiredValidator(errorText: "Required"),
                          onSaved: (String value) {
                            this.user.username = value;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20.0,
                          ),
                          child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Password",
                              ),
                              validator:
                                  RequiredValidator(errorText: "Required"),
                              onSaved: (String value) {
                                this.user.password = value;
                              },
                              obscureText: true),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              top: 20.0,
                            ),
                            child: RaisedButton(
                              onPressed: validate,
                              child: Text("Login"),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }
}
