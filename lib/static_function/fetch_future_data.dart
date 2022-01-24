
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_json_data_parse/model/employee.dart';
import 'package:flutter_json_data_parse/model/person.dart';
import 'package:flutter_json_data_parse/model/posts.dart';
import 'package:flutter_json_data_parse/model/student.dart';

class FetchFutureData{
  static var  decodedJson;
  static Future<String> loadJson(String assetJsonUrl) async
  {
    final String jsonData = await rootBundle.loadString(assetJsonUrl);
    return jsonData;
  }


  static Future<List<PostModel>> readJsonData() async {
    final dataList =  json.decode(await loadJson('assets/posts.json')) as List<dynamic>;
    decodedJson = dataList;
    return dataList.map((e) => PostModel.fromJson(e)).toList();
  }

  static Future<StudentModel> readStudentJsonData() async {
    final data = json.decode(await loadJson('assets/student.json'));
    decodedJson = data;
    return  StudentModel.fromJson(data);
  }

  static Future<PersonModel> readPersonJsonData() async{
    final data = json.decode(await loadJson('assets/person.json'));
    decodedJson = data;
    return PersonModel.fromJson(data);
  }

  static Future<EmployeeModel> readEmployeeJsonData() async{
    final data = json.decode(await loadJson('assets/employee.json'));
    decodedJson = data;
    return EmployeeModel.fromJson(data);
  }

}