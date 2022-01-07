import 'package:flutter/material.dart';
import 'package:stand/models/car.dart';

class CarDetail extends StatefulWidget {
  final Car _car;

  CarDetail(this._car);

  @override
  _CarDetailState createState() => _CarDetailState();
}

//TODO car detail pixel overflow
class _CarDetailState extends State<CarDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Detail'),
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
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    ListTile(
                      title: Text("${widget._car.brand} ${widget._car.model}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle:
                          Text("${widget._car.month}, ${widget._car.year}"),
                    ),
                    Container(
                      //TODO: caroussel slider
                      height: 200.0,
                      child: Ink.image(
                        image: AssetImage('assets/carocha.jfif'),
                        // TODO use image Url (currently not working)
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                              child:
                                  Text('License Plate: ${widget._car.plate}')),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Power: ${widget._car.power} HP'),
                                Text('Fuel: ${widget._car.fuelType}'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('CC: ${widget._car.cc} CC'),
                                Text('Color: ${widget._car.color}'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Mileage: ${widget._car.mileage} Km'),
                                Text('Gearbox: ${widget._car.gearBox}'),
                              ],
                            ),
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
                                        this.widget._car.reserved = val as bool;
                                      })
                                    },
                                    value: widget._car.reserved,
                                    checkColor: Colors.white,
                                    activeColor: Colors.red[600],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
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
  }
}
