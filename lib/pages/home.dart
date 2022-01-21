
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_data_parse/model/posts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  Future<List<PostModel>> readJsonData() async {
    final String _jsonData = await rootBundle.loadString('assets/posts.json');
    final dataList =  json.decode(_jsonData) as List<dynamic>;
    return dataList.map((e) => PostModel.fromJson(e)).toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff123456),
        title: const Text('Json Data',style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700,color: Colors.white),),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: readJsonData(),
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

      ),

    );
  }
}
