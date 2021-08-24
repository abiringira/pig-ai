import 'package:PigAi/controller/Network.dart';
import 'package:PigAi/model/Cargo.dart';
import 'package:PigAi/model/CargoSearchBill.dart';
import 'package:PigAi/router.dart';
import 'package:PigAi/screens/homePage.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CargoUpdate extends StatefulWidget {
  @override
  CargoUpdateState createState() => CargoUpdateState();
}

final TextEditingController commentController = new TextEditingController();

class CargoUpdateState extends State<CargoUpdate> {
  Future<Null> getRefresh() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  void initState() {
    super.initState();
    Global.initializeTimer();

    // refreshToken();
  }

  // void refreshToken() async {
  //   var token = await tokenRefresh();
  //
  //   setState(() {
  //     Global.token = token['access_token'];
  //   });
  // }

  Future tokenRefresh() async {
    String refreshApiToken = "/auth/refresh";

    Network network = new Network(refreshApiToken);

    var res = await network.logoutAndRefreshTokenRequest(refreshApiToken);

    return res;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    final GlobalKey<FormFieldState> _key = GlobalKey<FormFieldState>();

    String _bill;

    String _comment = "No";

    String text = "Processing date";

    final _containerSelected = TextEditingController();

    final _billSelected = TextEditingController();

    final String searchApi = "/truck/order";

    final String updateApi = "/update/status";

    Map jsonMap;

    Network network = new Network(searchApi);

    Network updateNetwork = new Network(updateApi);

    Cargo cargo;

    CargoSearchBill cargoSearchBill;

    var dataList;

    // var containerList;

    var containerData;

    List<String> doubleList;

    if (Global.userData != null) {
      dataList = Global.userData['bl'];

      doubleList = List<String>.generate(
          dataList.length, (int index) => '${dataList[index]['bill_lading']}');
    }

    reset() {
      _key.currentState.reset();
    }

    void _onSaving() {
      if (Global.saving == true) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  new CircularProgressIndicator(),
                  new Text("Saving",
                      style: TextStyle(color: _theme.accentColor)),
                ],
              ),
            );
          },
        );
      } else {
        Navigator.pop(context);
      }
    }

    void _onLoading() {
      if (Global.saving == true) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  new CircularProgressIndicator(),
                  new Text("Loading",
                      style: TextStyle(color: _theme.accentColor)),
                ],
              ),
            );
          },
        );
      } else {
        Navigator.pop(context);
      }
    }

    // Widget _onLoadingSuccess() {
    //   var widgetData;
    //
    //   if (Global.saving == true) {
    //     widgetData = showDialog(
    //       context: context,
    //       barrierDismissible: false,
    //       builder: (BuildContext context) {
    //         return Dialog(
    //           child: new Row(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               new CircularProgressIndicator(),
    //               new Text("Saving",
    //                   style: TextStyle(color: _theme.accentColor)),
    //             ],
    //           ),
    //         );
    //       },
    //     );
    //   } else {
    //     widgetData = AlertDialog(
    //       title: Text('Success',
    //           style: TextStyle(
    //               color: _theme.accentColor, fontWeight: FontWeight.bold)),
    //       content: SingleChildScrollView(
    //         child: ListBody(
    //           children: <Widget>[
    //             Text(
    //                 'Cargo  updated successfully! Click view to track it',
    //                 style: TextStyle(
    //                     color: _theme.accentColor, fontWeight: FontWeight.w500))
    //           ],
    //         ),
    //       ),
    //       actions: <Widget>[
    //         TextButton(
    //           child: Text('Track',
    //               style: TextStyle(
    //                   color: _theme.primaryColor, fontWeight: FontWeight.w400)),
    //           onPressed: () {
    //             Navigator.of(context).pushNamed(CargoTrackByBillRoute);
    //           },
    //         ),
    //       ],
    //     );
    //   }
    //
    //   return widgetData;
    // }

    void _onLoadingSuccess() {
      if (Global.saving == true) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  new CircularProgressIndicator(),
                  new Text("Saving",
                      style: TextStyle(color: _theme.accentColor)),
                ],
              ),
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success',
                  style: TextStyle(
                      color: _theme.accentColor, fontWeight: FontWeight.bold)),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Cargo updated successful',
                        style: TextStyle(
                            color: _theme.accentColor,
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok',
                      style: TextStyle(
                          color: _theme.primaryColor,
                          fontWeight: FontWeight.w400)),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CargoTrackByBillRoute);
                  },
                ),
              ],
            );
          },
        );
      }
    }

    void _onLoadingError() {
      if (Global.saving == true) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  new CircularProgressIndicator(),
                  new Text("Saving",
                      style: TextStyle(color: _theme.accentColor)),
                ],
              ),
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error',
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Failed to update',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w500))
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w400)),
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePageRoute);
                  },
                ),
              ],
            );
          },
        );
      }
    }

    Future<DateTime> _pickedDateDialog() {
      return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light(),
            child: child,
          );
        },
      );
    }

    Future<DateTime> callDatePicker() async {
      var order = await _pickedDateDialog();

      return order;
    }

    return Center(
        child: new SingleChildScrollView(
            child: new Container(
      padding: EdgeInsets.only(bottom: 200.0, left: 10.0, right: 10.0),
      color: Colors.white,
      child: new Column(children: <Widget>[
        Text("Add Status",
            style: TextStyle(
              color: _theme.accentColor,
              fontSize: 30.0,
            )),

        SizedBox(
          height: 15.0,
        ),

        DropDownField(
          controller: _billSelected,
          hintText: Global.billSelected == null
              ? "Select bill of lading"
              : Global.billSelected.toString(),
          hintStyle:
              TextStyle(color: _theme.accentColor, fontWeight: FontWeight.w500),
          itemsVisibleInDropdown: 8,
          items: doubleList,
          enabled: true,
          onValueChanged: (value) async {
            setState(() {
              Global.billSelected = value;

              Global.saving = true;
            });

            _onLoading();

            cargoSearchBill = new CargoSearchBill(Global.billSelected);

            jsonMap = cargoSearchBill.toJson();

            var getContainerByBill =
                await network.apiRequest(searchApi, jsonMap);

            containerData = getContainerByBill['containers'];

            setState(() {
              Global.containerList = List<String>.generate(containerData.length,
                  (int index) => '${containerData[index]['cont_no']}');

              var billId = List<String>.generate(containerData.length,
                  (int index) => '${containerData[0]['ladding_id']}');

              Global.bill = billId.length == 0
                  ? int.parse(billId.toString())
                  : int.parse(billId[0]);
              print(Global.bill);
            });

            if (Global.containerList != ["No Container"]) {
              setState(() {
                Global.saving = false;
              });

              _onLoading();
            }

            print(Global.containerList);
          },
        ),

        SizedBox(
          height: 10.0,
        ),

        ContainerWidget(),

        SizedBox(
          height: 10.0,
        ),
        //

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                child: Text(Global.dateTime == null ? text : Global.dateTime,
                    style: TextStyle(
                        color: _theme.accentColor,
                        fontWeight: FontWeight.w500)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.white12,
                      width: 15,
                    )),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: RaisedButton.icon(
                  color: Colors.white,
                  icon: Icon(Icons.date_range, color: _theme.accentColor),
                  elevation: 4.0,
                  onPressed: () async {
                    var newDate = await callDatePicker();

                    setState(() {
                      Global.dateTime = newDate.toString().substring(0, 10);
                    });

                    print(Global.dateTime);
                  },
                  label: Text("Pick date",
                      style: TextStyle(
                          color: _theme.accentColor,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: 10.0,
        ),

        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(30.0),
              ),
            ),
            filled: true,
            hintText: "Select status",
            hintStyle: TextStyle(color: _theme.accentColor),
            fillColor: Colors.white,
          ),
          value: "Select status",
          style:
              TextStyle(color: _theme.accentColor, fontWeight: FontWeight.w500),
          onChanged: (String Value) {
            setState(() {
              Global.status = Value;
            });
          },
          items: <String>[
            'Select status',
            'Receiving the documents',
            'Under shipping line procedures',
            'Under Customs Procedures',
            'Release order, Delivery order received.',
            'Prepare T1. / IM4 Documents',
            'Release / Exit documents.',
            'Lodge Port Charges.',
            'Pay Port Charges.',
            'Loading',
            'Truck/ Cargo in route Position.',
            'Crossed Border.',
            'Other',
            'Cargo arrived to' + '-client' + '  -Which ICD',
            'Cargo offloaded',
            'Empty container in route to Dar-Port',
            'Container drop off',
            'Interchange returned',
            'File Closed.'
          ]
              .map((cityTitle) => DropdownMenuItem(
                  value: cityTitle,
                  child: Text(
                    "$cityTitle",
                    style: TextStyle(
                        color: _theme.accentColor, fontWeight: FontWeight.w500),
                  )))
              .toList(),
        ),

        SizedBox(
          height: 10.0,
        ),

        SizedBox(
          height: 10.0,
        ),

        new TextFormField(
            // initialValue: "No",
            style: TextStyle(color: _theme.accentColor),
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            controller: commentController,
            decoration: InputDecoration(
              hintText: "Any other comment",
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,

                  // color: Colors.grey[400],
                  color: _theme.accentColor),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400])),
            )),

        SizedBox(
          height: 10.0,
        ),

        new RaisedButton(
          child: const Text('Save Changes', style: TextStyle(fontSize: 16.0)),
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          elevation: 4.0,
          splashColor: Colors.blueGrey,
          onPressed: () async {
            setState(() {
              Global.saving = true;
            });

            _onSaving();

            var _commentTxt = commentController.text.toString() == null
                ? _comment
                : commentController.text.toString();

            cargo = new Cargo(Global.bill, Global.containerNo, Global.dateTime,
                Global.status, _commentTxt);

            Map json = cargo.toJson();

            try {
              Map response = await updateNetwork.apiRequest(updateApi, json);

              if (response['response'] == "order updated successful") {
                setState(() {
                  Global.saving = false;
                });

                print(response['response']);

                _onLoadingSuccess();
              } else {
                setState(() {
                  Global.saving = false;
                });
                _onLoadingError();
              }
            } catch (Exception) {
              print(Exception);
              setState(() {
                Global.saving = false;
              });
              _onLoadingError();
            }
          },
        )

        //
      ]),
    )));
  }
}

class ContainerWidget extends StatelessWidget {
  Future<Null> getRefresh() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final _containerSelected = TextEditingController();

    return RefreshIndicator(
      onRefresh: getRefresh,
      child: DropDownField(
          controller: _containerSelected,
          itemsVisibleInDropdown: 7,
          hintText: "Select container no",
          hintStyle:
              TextStyle(color: _theme.accentColor, fontWeight: FontWeight.w500),
          textStyle:
              TextStyle(color: _theme.accentColor, fontWeight: FontWeight.w500),
          items: Global.containerList,
          enabled: true,
          onValueChanged: (value) {
            Global.containerNo = value;
          }),
    );
  }
}
