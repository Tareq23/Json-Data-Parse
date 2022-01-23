
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_data_parse/model/posts.dart';
import 'package:flutter_json_data_parse/widgets/drawer_header_widget.dart';

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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var listTileTextStyle =  const TextStyle(color:Colors.white,fontWeight: FontWeight.w500,fontSize: 22);

  void closeDrawer()
  {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  Future<List<PostModel>> readJsonData() async {
    final String _jsonData = await rootBundle.loadString('assets/posts.json');
    final dataList =  json.decode(_jsonData) as List<dynamic>;
    return dataList.map((e) => PostModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children:   [
             const DrawerHeaderWidget(),
             Container(
               margin: const EdgeInsets.symmetric(vertical: 5),
               decoration: const BoxDecoration(
                 color:  Color(0xff123456)
               ),
               child: ListTile(
                 onTap: (){
                   closeDrawer();
                 },
                 title:  Text('Simple JSON',style: listTileTextStyle,),
               ),
             ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: const BoxDecoration(
                  color:  Color(0xff123456)
              ),
              child: ListTile(
                 onTap: (){
                   closeDrawer();
                 },
                 title:  Text('Simple JSON & Array',style: listTileTextStyle,),
               ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: const BoxDecoration(
                  color:  Color(0xff123456)
              ),
              child: ListTile(
                 onTap: (){
                   closeDrawer();
                 },
                 title:  Text('Nested JSON',style: listTileTextStyle,),
               ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: const BoxDecoration(
                  color:  Color(0xff123456)
              ),
              child: ListTile(
                 onTap: (){
                   closeDrawer();
                 },
                 title:  Text('Nested JSON & List',style: listTileTextStyle,),
               ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: const BoxDecoration(
                  color:  Color(0xff123456)
              ),
              child: ListTile(
                 onTap: (){
                   closeDrawer();
                 },
                 title:  Text('List Of Map',style: listTileTextStyle,),
               ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: const BoxDecoration(
                  color:  Color(0xff123456)
              ),
              child: ListTile(
                 onTap: (){
                   closeDrawer();
                 },
                 title:  Text('Complex Nested Json',style: listTileTextStyle,),
               ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff123456),
        title: const Text('Json Data',style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700,color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu,size: 34,color: Colors.white,),
        ),
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
