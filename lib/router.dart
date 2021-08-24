import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:PigAi/screens/homePage.dart';
import 'package:PigAi/screens/splashScreen.dart';

const String WalkThroughRoute = "/";
const String AuthenticationRoute = "/auth";
const String HomePageRoute = "/api/auth/login";
const String RegisterRoute = "/register";
const String UserProfileRoute = "/userProfile";
const String CargoTrackByBillRoute = "/cargoTrackByBill";
const String CargoTrackByContainerRoute = "/cargoTrackByContainer";
const String CargoTrackHomeRoute = "/cargoHome";
const String CargoResultRoute = "/cargoResult";

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case WalkThroughRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => WalkThrough());

    case HomePageRoute:
      return MaterialPageRoute(builder: (BuildContext context) => HomePage());

    default:
      return MaterialPageRoute(
          builder: (BuildContext context) => WalkThrough());
  }
}
