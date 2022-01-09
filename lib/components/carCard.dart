import 'package:flutter/material.dart';
import 'package:stand/models/car.dart';
import 'package:stand/models/user.dart';

import '../routes.dart';

class CarCard extends StatefulWidget {
  final Car _car;
  final User _user;

  CarCard(this._car, this._user);

  @override
  _CarCardState createState() => _CarCardState();
}

class _CarCardState extends State<CarCard> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.CarDetailRoute,
            arguments: {"car": widget._car, "user" : widget._user});
      },
      child: Card(
          elevation: 4.0,
          child: Column(
            children: [
              ListTile(
                title: Text("${widget._car.brand} ${widget._car.model}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("${widget._car.month}, ${widget._car.year}"),
              ),
              Container(
                //TODO: caroussel slider
                height: 200.0,
                child: Ink.image(
                  image: AssetImage('assets/carocha.jfif'),
                  // TODO use image Url (currently not working)
                  //Image.network(_car.imageUrl) as ImageProvider,//AssetImage('assets/carocha.jfif'),//car.images.first, //TODO verificar se é imagaprovider no obj
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Power: ${widget._car.power} HP'),
                        Text('Plate: ${widget._car.plate}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Price: ${widget._car.price} €'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Reserved'),
                            Checkbox(
                              onChanged: (val) => {
                                setState(() {
                                  widget._car.reserved = val;
                                })
                              },
                              value: widget._car.reserved,
                              checkColor: Colors.white,
                              activeColor: Colors
                                  .red[600], //TODO verificar cor da checkbox
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
