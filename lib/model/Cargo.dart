

class Cargo {

  final int ladding_id;
  final String cont_no;
  final String procesing_date;
  final String processing_status;
  final String other_comment;

  Cargo(this.ladding_id, this.cont_no, this.procesing_date,
      this.processing_status, this.other_comment);

  Map<String,dynamic> toJson () {

    final Map<String,dynamic> data = new Map<String,dynamic>();

    data['ladding_id'] = this.ladding_id;
    data['cont_no'] = this.cont_no;
    data['processing_date'] = this.procesing_date;
    data['processing_status'] = this.processing_status;
    data['other_comment'] = this.other_comment;

    return data;

  }
}