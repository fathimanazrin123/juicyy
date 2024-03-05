class LoginResp {
  bool? status;
  String? message;
  String? id;

  LoginResp({this.status, this.message, this.id});

  LoginResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['id'] = this.id;
    return data;
  }
}
