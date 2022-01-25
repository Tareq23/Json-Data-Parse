
import 'package:flutter/material.dart';
import 'package:flutter_json_data_parse/model/complex/product.dart';

class ProductDetailsPage extends StatefulWidget {

  final ProductModel? product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _ProductDetailsPageState createState() => _ProductDetailsPageState(product: product);
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  final ProductModel? product;
  _ProductDetailsPageState({required this.product});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade700,
          title: const Text('Product Details',style: TextStyle(color: Colors.white),),
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,),
          ) ,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3.5,
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: product!.imgList!.length,
                  itemBuilder: (context,index){
                    return Card(
                      elevation: 13,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: SizedBox(
                          height: double.infinity,
                          width: MediaQuery.of(context).size.width/1.5,
                          child: Image(
                            image: AssetImage(product!.imgList![index].toString()),
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 25,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Commercial-Name : ${product!.commercialName}"),
                    product!.mass != null ? Text("Brand-Name : ${product!.genericName}") : Text("Business-Name : ${product!.genericName}"),
                    Text("Price : ${product!.price}"),
                    product!.mass != null ? Text("Weight : ${product!.mass}") : const Text(""),
                    Text("Description : ${product!.description}"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
