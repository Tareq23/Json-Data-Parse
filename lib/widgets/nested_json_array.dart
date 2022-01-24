import 'package:flutter/material.dart';
import 'package:flutter_json_data_parse/model/complex/user.dart';
import 'package:flutter_json_data_parse/static_function/fetch_future_data.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NestedJsonArrayWidget extends StatelessWidget {
  const NestedJsonArrayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FetchFutureData.readUserJsonData(),
      builder: (context, nestedData) {
        if (nestedData.hasError) {
          return Center(
            child: Text(nestedData.error.toString()),
          );
        } else if (nestedData.hasData) {
          var data = nestedData.data as UserModel;
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: ListView(
              children: [
                Card(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        child: Text("Name :  ${data.name}"),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        child: Text("Phone :  ${data.phone}"),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        child: Text("Email :  ${data.email}"),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        child: Text("Address :  ${data.address}"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.teal.shade900,
                  child: const Text(
                    "Friends",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 28),
                  ),
                ),
                AlignedGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemCount: data.friends!.length,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Card(
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.purple.shade900,
                          child: Column(
                            children: [
                              Text("${data.friends![index].name}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
                              const SizedBox(height: 10,),
                              Text("${data.friends![index].email}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
                              const SizedBox(height: 10,),
                              Text("${data.friends![index].address}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
                              const SizedBox(height: 10,),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
