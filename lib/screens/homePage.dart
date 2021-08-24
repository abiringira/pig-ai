import 'dart:async';
import 'package:PigAi/controller/Network.dart';
import 'package:PigAi/screens/cargoUpdate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../router.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<HomePage> {
  int _selectedIndex = 0;

  var data;

  var ordersData;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  // _MyNavigationBarState(this.state);

  Widget currentScreen;

  List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    Widget _page1 = CargoUpdate();

    _pages = [_page1];

    _selectedIndex = 0;

    if (Global.currentScreen == CargoUpdate()) {
      Global.currentScreen = _page1;
    } else {
      Global.currentScreen = _page1;
    }
  }

  void _onItemTapped(int index) async {
    // String refreshApiToken = "/auth/refresh";
    //
    // Network network = new Network(refreshApiToken);
    //
    // Map response =  await network.logoutAndRefreshTokenRequest(refreshApiToken);
    setState(() {
      // Global.token = response['access_token'].toString();
      _selectedIndex = index;
      Global.currentScreen = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Pig Traceability',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          backgroundColor: _theme.accentColor,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.person_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  Global.currentScreen = _pages[3];
                });
              },
              focusColor: _theme.primaryColor,
            ),
          ],
        ),
        body: ModalProgressHUD(
            child: Global.currentScreen, inAsyncCall: Global.saving),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  title: Text('Home'),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.art_track),
                  title: Text('Cargo Tracking'),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                icon: Icon(Icons.edit_road_rounded),
                title: Text('Cargo Update'),
                backgroundColor: Colors.white,
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: _theme.accentColor,
            unselectedItemColor: _theme.primaryColor,
            iconSize: 40,
            onTap: _onItemTapped,
            elevation: 5));
  }
}

class Global {
  static Widget currentScreen = CargoUpdate();

  static double number = 10.0;

  static String token = "";

  static bool saving = false;

  static var userProfile;

  static var userOrders;

  static var userData;

  static var usertrackResult;

  static var containerNo;

  static var dateTime;

  static var status;

  static var bill;

  static var billSelected;

  static List<String> containerList = ["No Container"];

  static Timer _timer;

  static bool forceLogout = false;

  final navigatorKey = GlobalKey<NavigatorState>();

  static void initializeTimer() {
    _timer = Timer.periodic(const Duration(minutes: 3), (_) => _logOutUser());
  }

  static void _logOutUser() {
    // Log out the user if they're logged in, then cancel the timer.
    // You'll have to make sure to cancel the timer if the user manually logs out
    //   and to call _initializeTimer once the user logs in
    _timer.cancel();

    forceLogout = true;
  }

  // You'll probably want to wrap this function in a debounce
  static void _handleUserInteraction([_]) {
    print("_handleUserInteraction");
    _timer.cancel();
    initializeTimer();
  }

  void navToHomePage(BuildContext context) {
    //Clear all pref's
    // SharedPreferencesHelper.clearAllValues();

    Navigator.of(context).pushNamed(AuthenticationRoute);

    // navigatorKey.currentState.pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => LoginPage()),
    //         (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    if (forceLogout) {
      print("ForceLogout is $forceLogout");
      navToHomePage(context);
    }
    return GestureDetector(
        onTap: _handleUserInteraction,
        onPanDown: _handleUserInteraction,
        onScaleStart: _handleUserInteraction,

        // ... repeat this for all gesture events
        child: MaterialApp(
          navigatorKey: navigatorKey,
          // ...
          // ...
        ));
  }

  static Future tokenRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));

    String refreshApiToken = "/auth/refresh";

    Network network = new Network(refreshApiToken);

    var res = await network.logoutAndRefreshTokenRequest(refreshApiToken);

    token = res['access_token'];

    // print(token);
    //
    // print(Global.token);

    return token;
  }
}
