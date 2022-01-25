
import 'package:flutter_json_data_parse/model/complex/categories.dart';

class EcommerceModel{
  String? authorName;
  String? authorEmail;
  String? bannerImgUrl;
  List<CategoryModel>? categories;


  EcommerceModel.fromJson(Map<String,dynamic>parsedJson)
  {
    var list = parsedJson['category'] as List;
    List<CategoryModel>categoryList = list.map((e) => CategoryModel.fromJson(e)).toList();
    authorEmail = parsedJson['author-email'];
    authorName = parsedJson['author-name'];
    categories = categoryList;
    bannerImgUrl = parsedJson['image'];
  }

}