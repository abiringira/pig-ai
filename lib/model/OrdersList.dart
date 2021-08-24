import 'package:PigAi/model/Orders.dart';

class OrdersList {
  List<Orders> orders;

  OrdersList({this.orders});

  factory OrdersList.fromJson(List<dynamic> parsedJson) {
    List<Orders> orders = new List<Orders>();

    orders = parsedJson.map((i) => Orders.fromJson(i)).toList();

    return new OrdersList(orders: orders);
  }
}
