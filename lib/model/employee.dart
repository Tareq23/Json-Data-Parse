

import 'package:flutter_json_data_parse/model/business_address.dart';
import 'package:flutter_json_data_parse/model/home_address.dart';

class EmployeeModel
{
  String? name;
  int? age;
  HomeAddressModel? homeAddress;
  BusinessAddressModel? businessAddress;
  EmployeeModel({this.name,this.age,this.homeAddress,this.businessAddress});

  EmployeeModel.fromJson(Map<String,dynamic>parsedJson)
  {
    name = parsedJson['name'];
    age = parsedJson['age'];
    homeAddress = HomeAddressModel.fromJson(parsedJson['homeAddress']);
    businessAddress = BusinessAddressModel.fromJson(parsedJson['businessAddress']);
  }

}