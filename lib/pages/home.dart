import 'package:flutter/material.dart';
import 'package:flutter_json_data_parse/static_function/fetch_future_data.dart';
import 'package:flutter_json_data_parse/widgets/drawer_header_widget.dart';
import 'package:flutter_json_data_parse/widgets/json_array.dart';
import 'package:flutter_json_data_parse/widgets/json_list_map.dart';
import 'package:flutter_json_data_parse/widgets/nested_json.dart';
import 'package:flutter_json_data_parse/widgets/simple_json.dart';

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
  var listTileTextStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22);
  bool isSimpleJson = false;
  bool isSimpleJsonArray = false;
  bool isNestedJson = false;
  bool isNestedJsonList = false;
  bool isJsonListMap = false;
  bool isComplexNestedJson = false;

  void closeDrawer() {
    setState(() {
      isSimpleJson = false;
      isSimpleJsonArray = false;
      isNestedJson = false;
      isNestedJsonList = false;
      isJsonListMap = false;
      isComplexNestedJson = false;
      FetchFutureData.decodedJson = null;
    });
    _scaffoldKey.currentState!.openEndDrawer();
  }


  void _showAlertDialog(BuildContext context)
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text('Json Data Sample'),
          content: SingleChildScrollView(
            child:  Text(FetchFutureData.decodedJson.toString()),
          ),
          actions: [
            OutlinedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
            )
          ],
        );
      },

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeaderWidget(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: const BoxDecoration(color: Color(0xff123456)),
                child: ListTile(
                  onTap: () {
                    closeDrawer();
                    setState(() {
                      isSimpleJson = true;
                    });
                  },
                  title: Text(
                    'Simple JSON',
                    style: listTileTextStyle,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: const BoxDecoration(color: Color(0xff123456)),
                child: ListTile(
                  onTap: () {
                    closeDrawer();
                    setState(() {
                      isSimpleJsonArray = true;
                    });
                  },
                  title: Text(
                    'Simple JSON & Array',
                    style: listTileTextStyle,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: const BoxDecoration(color: Color(0xff123456)),
                child: ListTile(
                  onTap: () {
                    closeDrawer();
                    setState(() {
                      isNestedJson = true;
                    });
                  },
                  title: Text(
                    'Nested JSON',
                    style: listTileTextStyle,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: const BoxDecoration(color: Color(0xff123456)),
                child: ListTile(
                  onTap: () {
                    closeDrawer();
                  },
                  title: Text(
                    'Nested JSON & List',
                    style: listTileTextStyle,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: const BoxDecoration(color: Color(0xff123456)),
                child: ListTile(
                  onTap: () {
                    closeDrawer();
                    setState(() {
                      isJsonListMap = true;
                    });
                  },
                  title: Text(
                    'List Of Map',
                    style: listTileTextStyle,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: const BoxDecoration(color: Color(0xff123456)),
                child: ListTile(
                  onTap: () {
                    closeDrawer();
                  },
                  title: Text(
                    'Complex Nested Json',
                    style: listTileTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xff123456),
          title: const Text(
            'Json Data',
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              size: 34,
              color: Colors.white,
            ),
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  _showAlertDialog(context);
                },
                child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 30),
                    child: const Text('Show Json')
                ),
            )

          ],
        ),
        body: isJsonListMap ? const JsonListMapWidget() :
              isSimpleJson ?  SimpleJsonWidget() :
              isSimpleJsonArray ? const JsonArrayWidget() :
              isNestedJson ? const NestedJsonWidget() :
              null,
      // body: const SimpleJsonWidget(),
    );
  }
}
