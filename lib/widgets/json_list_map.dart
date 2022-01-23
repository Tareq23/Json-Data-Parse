
import 'package:flutter/material.dart';
import 'package:flutter_json_data_parse/model/posts.dart';
import 'package:flutter_json_data_parse/static_function/fetch_future_data.dart';

class JsonListMapWidget extends StatelessWidget {
  const JsonListMapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FetchFutureData.readJsonData(),
        builder: (context,data)
        {
          if(data.hasError) {
            return Center( child: Text('${data.error}'),);
          }
          else if(data.hasData){
            var listData = data.data as List<PostModel>;
            return ListView.builder(
              itemCount: listData.length,
              itemBuilder: (context,index){
                return Card(
                  elevation: 10,
                  margin:const EdgeInsets.only(top: 10) ,
                  child: ListTile(
                    title: Text(listData[index].title.toString(),style: const TextStyle(color: Color(0xff123456),fontSize: 24),),
                    subtitle: Text(listData[index].body.toString(),style: const TextStyle(color: Colors.black54),),
                  ),
                );
              },
            );
          }
          else{
            return const Center(child: CircularProgressIndicator(),);
          }
        }

    );
  }
}
