import 'package:flutter/material.dart';
import 'package:stand/pages/cars/carDetail.dart';
import 'package:stand/pages/clients/clientsList.dart';
import 'package:stand/pages/login/login.dart';
import 'package:stand/pages/partners/partnerList.dart';
import 'package:stand/pages/parts/partList.dart';
import 'package:stand/pages/sales/salesList.dart';
import 'pages/menu.dart';
import 'pages/cars/carList.dart';

const LoginRoute = '/';
const MenuRoute = '/menu';
const CarListRoute = '/car-list';
const CarDetailRoute = '/car-detail';
const SalesListRoute = '/sales';
const ClientsListRoute = '/clients';
const PartsListRoute = '/parts';
const SuppliersListRoute = '/suppliers';

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
      initialRoute: '/',    // Nao esquecer de alterar
      onGenerateRoute: _routes(),
    );
  }


  RouteFactory _routes(){
    return (settings) {
      final Map <String, dynamic> arguments = settings.arguments;
      Widget screen = Menu();
      switch (settings.name){
        case LoginRoute:
          screen = Login();
          break;
        case MenuRoute:
          screen = Menu();
          break;
        case CarListRoute:
          screen = CarList();
          break;
        case CarDetailRoute:
          screen = CarDetail(arguments['car']);
          break;
        case SalesListRoute:
          screen = SalesList();
          break;
        case ClientsListRoute:
          screen = ClientsList();
          break;
        case PartsListRoute:
          screen = PartsList();
          break;
        case SuppliersListRoute:
          screen = PartnerList();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext) => screen);
    };
  }
}

