class GetProductResponse {
  bool? status;
  String? message;
  List<Data>? data;

  GetProductResponse({this.status, this.message, this.data});

  GetProductResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? pname;
  String? size;
  String? prize;
  String? image;

  Data({this.id, this.pname, this.size, this.prize, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pname = json['pname'];
    size = json['size'];
    prize = json['prize'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pname'] = this.pname;
    data['size'] = this.size;
    data['prize'] = this.prize;
    data['image'] = this.image;
    return data;
  }
}
