
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_json_data_parse/model/posts.dart';

class FetchFutureData{
  static var  decodedJson;
  static Future<String> loadJson(String assetJsonUrl) async
  {
    final String jsonData = await rootBundle.loadString(assetJsonUrl);
    return jsonData;
  }

  // static Future jsonDecode(String assetJsonUrl) async{
  //   final jsonList =  json.decoder(await loadJson(assetJsonUrl)) as List<dynamic>;
  // }

  static Future<List<PostModel>> readJsonData() async {
    final dataList =  json.decode(await loadJson('assets/posts.json')) as List<dynamic>;
    // print(dataList);
    decodedJson = dataList;
    return dataList.map((e) => PostModel.fromJson(e)).toList();
  }

}