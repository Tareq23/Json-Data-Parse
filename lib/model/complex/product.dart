

import 'package:flutter_json_data_parse/model/complex/image.dart';

class ProductModel{
  int? id;
  String? commercialName;
  String? genericName;
  int? mass;
  int? price;
  List<String>? imgList;
  String? description;

  // ProductModel.grocery({this.id,this.commercialName,this.genericName,this.mass,this.price,this.description,this.imgList});
  // ProductModel.medicine({this.id,this.commercialName,this.genericName,this.price,this.description,this.imgList});

  ProductModel.fromJsonMedicine(Map<String,dynamic>parsedJson){
    var list = parsedJson['images'];
    id = parsedJson['id'];
    commercialName = parsedJson['commercial-name'];
    genericName = parsedJson['generic-name'];
    price = parsedJson['price'];
    imgList = List<String>.from(list);
    description = parsedJson['description'];
  }
  ProductModel.fromJsonGrocery(Map<String,dynamic>parsedJson){
    var list = parsedJson['images'] ;
    id = parsedJson['id'];
    commercialName = parsedJson['commercial-name'];
    genericName = parsedJson['generic-name'];
    price = parsedJson['price'];
    imgList = List<String>.from(list);
    description = parsedJson['description'];
    mass = parsedJson['mass'];
  }
}