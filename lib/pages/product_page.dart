import 'package:flutter/material.dart';
import 'package:flutter_json_data_parse/model/complex/categories.dart';
import 'package:flutter_json_data_parse/model/complex/product.dart';
import 'package:flutter_json_data_parse/pages/home.dart';

class ProductPage extends StatelessWidget {

  CategoryModel category;

  ProductPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductHome(categoryModel: category,),
    );
  }
}

// ignore: must_be_immutable
class ProductHome extends StatefulWidget {
  // const ProductHome({Key? key}) : super(key: key);
  CategoryModel categoryModel;
  ProductHome({Key? key, required this.categoryModel}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  _ProductHomeState createState() => _ProductHomeState(category: categoryModel);
}

class _ProductHomeState extends State<ProductHome> {
  CategoryModel category;
  _ProductHomeState({required this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          title: Text(
            "${category.name} Products".toUpperCase(),
            style: const TextStyle(fontSize:32,color: Colors.white,fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
            },
            icon: Icon(Icons.arrow_back,size: 30,color: Colors.white,),
          ),
        ),
      ),
    );
  }
}
