
class LoginResponse {
  int ? userid;
  String ? username;
  String ? name;
  String ? roles;
  String ? designation;
  String ? lineManager;
  String ? locations;
  List<int> ? upozilas;
  String ? status;
  String ? otp;

  LoginResponse(
      {this.username,
      this.userid,
      this.name,
      this.roles,
      this.designation,
      this.lineManager,
      this.locations,
      this.upozilas,
      this.status,
      this.otp
      });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    userid = json['userId'];
    username = json['username'];
    name = json['name'];
    roles = json['roles'];
    designation = json['designation'];
    lineManager = json['lineManager'] is int ? (json['lineManager'] as int).toString() : json['lineManager'];
    locations = json['locations'];
    upozilas = json['upozilas'].cast<int>();
    status = json['status'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userid;
    data['username'] = this.username;
    data['name'] = this.name;
    data['roles'] = this.roles;
    data['designation'] = this.designation;
    data['lineManager'] = this.lineManager;
    data['locations'] = this.locations;
    data['upozilas'] = this.upozilas;
    data['status'] = this.status;
    data['otp'] = this.otp;
    return data;
  }
}