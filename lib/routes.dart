
import 'package:flutter/material.dart';
import 'pages/cars/carDetail.dart';
import 'pages/cars/carList.dart';
import 'pages/clients/clientsList.dart';
import 'pages/login/login.dart';
import 'pages/menu.dart';
import 'pages/partners/partnerList.dart';
import 'pages/parts/partList.dart';
import 'pages/sales/salesList.dart';

class Routes {

  // Routes
  static const LoginRoute = '/';
  static const MenuRoute = '/menu';
  static const CarListRoute = '/car-list';
  static const CarDetailRoute = '/car-detail';
  static const SalesListRoute = '/sales';
  static const ClientsListRoute = '/clients';
  static const PartsListRoute = '/parts';
  static const SuppliersListRoute = '/suppliers';

  static RouteFactory router(){
    return (settings) {
      final Map <String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name){
        case LoginRoute:
          screen = Login();
          break;
        case MenuRoute:
          screen  = Menu(arguments['user']);
          break;
        case CarListRoute:
          screen = CarList(arguments['user']);
          break;
        case CarDetailRoute:
          screen = CarDetail(arguments['car'], arguments['user']);
          break;
        case SalesListRoute:
          screen = SalesList(arguments['user']);
          break;
        case ClientsListRoute:
          screen = ClientsList(arguments['user']);
          break;
        case PartsListRoute:
          screen = PartsList(arguments['user']);
          break;
        case SuppliersListRoute:
          screen = PartnerList(arguments['user']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext) => screen);
    };
  }

}