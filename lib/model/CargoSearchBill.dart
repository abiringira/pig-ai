class CargoSearchBill {
  final String bill_lading;

  CargoSearchBill(this.bill_lading);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['bill_lading'] = this.bill_lading;

    return data;
  }
}
