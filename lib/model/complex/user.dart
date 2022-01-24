

import 'package:flutter_json_data_parse/model/complex/friends.dart';

class UserModel
{
  String? name;
  String? phone;
  String? email;
  String? address;
  // FriendModel? friendModel;
  List<FriendModel>? friends;
  UserModel({this.name,this.phone,this.email,this.address,this.friends});

  UserModel.fromJson(Map<String,dynamic>parsedJson)
  {
    var list = parsedJson['friends'] as List;
    List<FriendModel> friendList = list.map((e) => FriendModel.fromJson(e)).toList();

    name = parsedJson['name'];
    phone = parsedJson['phone'];
    email = parsedJson['email'];
    address = parsedJson['address'];
    friends = friendList;
  }

}