import 'package:flutter_json_data_parse/model/complex/product.dart';

class CategoryModel {
  int? id;
  String? name;
  int? totalProduct;
  List<ProductModel>? groceryProduct;
  List<ProductModel>? medicineProduct;

  // CategoryModel(
  //     {this.id,
  //     this.name,
  //     this.totalProduct,
  //     this.groceryProduct,
  //     this.medicineProduct});

  CategoryModel.fromJson(Map<String, dynamic> parsedJson) {
    var list;
    id = parsedJson['id'];
    name = parsedJson['name'];
    totalProduct = parsedJson['total-product'];
    medicineProduct = null;
    groceryProduct = null;
    if (name == "grocery") {
       list = parsedJson['products'] as List;
       var _list = list.map((productItem)=>ProductModel.fromJsonGrocery(productItem));
      List<ProductModel> productList = List<ProductModel>.from(_list);
      groceryProduct = productList;
    } else if(name == "medicine") {
      list = parsedJson['products'] as List;
      var _list = list.map((productItem) => ProductModel.fromJsonMedicine(productItem));
      List<ProductModel> productList = List<ProductModel>.from(_list);
      medicineProduct = productList;
    }
  }
}
