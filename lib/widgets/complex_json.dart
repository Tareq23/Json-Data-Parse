
import 'package:flutter/material.dart';
import 'package:flutter_json_data_parse/model/complex/ecommerce.dart';
import 'package:flutter_json_data_parse/pages/product_page.dart';
import 'package:flutter_json_data_parse/static_function/fetch_future_data.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ComplexJsonWidget extends StatelessWidget {
  const ComplexJsonWidget({Key? key}) : super(key: key);

  final textStyle = const TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 28);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FetchFutureData.readEcommerceJsonData(),
      builder: (context,complexData){
        if(complexData.hasError){
          return Center(child: Text(complexData.error.toString()),);
        }
        else if(complexData.hasData){
          var data = complexData.data as EcommerceModel;
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  margin: const EdgeInsets.all(0),
                  child: Image(
                    image: AssetImage(data.bannerImgUrl.toString()),
                    fit: BoxFit.cover,
                  )
                ),
                const SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height-270,
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                  child: MasonryGridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemCount: data.categories!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              ProductPage(category: data.categories![index])));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Card(
                            elevation: 15,
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.purple.shade900,
                              ),
                              child: Text(data.categories![index].name.toString(),style: textStyle),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }
        else{
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
