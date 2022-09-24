class EmployeeVerificationModel {
  String? status;
  List<Data>? data;

  EmployeeVerificationModel({this.status, this.data});

  EmployeeVerificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? employeeId;
  String? firstName;
  String? lastName;
  String? email;
  String? salary;
  Null? imageUrl;
  String? password;
  String? phone;
  String? nid;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.employeeId,
        this.firstName,
        this.lastName,
        this.email,
        this.salary,
        this.imageUrl,
        this.password,
        this.phone,
        this.nid,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employeeId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    salary = json['salary'];
    imageUrl = json['imageUrl'];
    password = json['password'];
    phone = json['phone'];
    nid = json['nid'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employeeId'] = this.employeeId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['salary'] = this.salary;
    data['imageUrl'] = this.imageUrl;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['nid'] = this.nid;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
