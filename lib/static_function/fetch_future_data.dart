
import 'dart:convert';

import 'package:flutter/services.dart';
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
    final dataList = json.decode(await loadJson('assets/student.json'));
    decodedJson = dataList;
    return  StudentModel.fromJson(dataList);
  }

}