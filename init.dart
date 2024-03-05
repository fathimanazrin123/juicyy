class Initialdata {
  bool? status;
  String? message;
  List<Datum>? data;

  Initialdata({this.status, this.message, this.data});

  Initialdata.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Datum>[];
      json['data'].forEach((v) {
        data!.add(new Datum.fromJson(v));
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

class Datum {
  String? id;
  String? pname;
  String? size;
  String? prize;
  String? image;

  Datum({this.id, this.pname, this.size, this.prize, this.image});

  Datum.fromJson(Map<String, dynamic> json) {
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
