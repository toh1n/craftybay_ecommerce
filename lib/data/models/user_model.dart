import 'package:craftybay_ecommerce/data/models/user_data.dart';

class UserModel {
  String? msg;
  Data? data;

  UserModel({this.msg, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

