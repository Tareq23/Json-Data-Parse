import 'package:flutter/material.dart';
import 'package:flutter_json_data_parse/model/complex/categories.dart';
import 'package:flutter_json_data_parse/model/complex/product.dart';
import 'package:flutter_json_data_parse/pages/home.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text(
            "${category.name} Products".toUpperCase(),
            style: const TextStyle(fontSize:28,color: Colors.white,fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
            },
            icon: const Icon(Icons.arrow_back,size: 30,color: Colors.white,),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          itemCount: category.name == "medicine" ? category.medicineProduct!.length : category.groceryProduct!.length,
          itemBuilder: (context, index) {
            var productList = category.name == "medicine" ? category.medicineProduct! : category.groceryProduct!;
            return ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Card(
                elevation: 15,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.shade900,
                  ),
                  child: Stack(
                    children: [
                      Image(
                        image: AssetImage(productList[index].imgList![0]),
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.lightBlueAccent.withOpacity(0.6),
                          ),
                          child: Text(productList[index].commercialName.toString(),style: TextStyle(color: Colors.white),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
