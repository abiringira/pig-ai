
class CargoSearchContainer {


  final String cont_no ;

  CargoSearchContainer(this.cont_no);

  Map<String, dynamic> toJson () {

    final Map<String, dynamic> data = new Map<String, dynamic>();

       data['cont_no'] = this.cont_no;

       return data;
  }
}