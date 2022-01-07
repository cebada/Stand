import 'package:flutter/material.dart';
import 'package:stand/main.dart';
import 'package:stand/models/car.dart';

class CarCard extends StatefulWidget {
  final Car _car;

  CarCard(this._car);

  @override
  _CarCardState createState() => _CarCardState();
}

class _CarCardState extends State<CarCard> {
  Car _car;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CarDetailRoute,
            arguments: {"car": widget._car});
      },
      child: Card(
          elevation: 4.0,
          child: Column(
            children: [
              ListTile(
                title: Text("${_car.brand} ${_car.model}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("${_car.month}, ${_car.year}"),
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
                        Text('Power: ${_car.power} HP'),
                        Text('Plate: ${_car.plate}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Price: ${_car.price} €'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Reserved'),
                            Checkbox(
                              onChanged: (val) => {
                                setState(() {
                                  this._car.reserved = val as bool;
                                })
                              },
                              value: _car.reserved,
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

  @override
  void initState() {
    super.initState();
    this._car = widget._car;
  }
}
