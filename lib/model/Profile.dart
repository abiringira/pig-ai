class Profile {

  String email;
  String name;
  String phone;
  String createdAt;


  Profile({this.email, this.name, this.phone, this.createdAt});

   Profile.fromJson (Map<String, dynamic> json ) :
      email = json['employee_email'],
      name =  json['employee_name'],
      phone = json['employee_phone'],
      createdAt = json['created_at'];

}