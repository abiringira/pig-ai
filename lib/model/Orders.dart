
class Orders {

  String bill;
  String clientName;
  String destination;
  String date;
  String shipping;


  Orders({this.bill, this.clientName, this.destination, this.date,
      this.shipping});

  Orders.fromJson (Map<String, dynamic> json ) :
        bill = json['bill_lading'],
        clientName =  json['client_name'],
        destination = json['destination'],
        date = json['date'],
        shipping = json['shipping'];

}