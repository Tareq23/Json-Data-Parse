
import 'package:flutter/material.dart';
import 'package:flutter_json_data_parse/model/person.dart';
import 'package:flutter_json_data_parse/static_function/fetch_future_data.dart';

class JsonArrayWidget extends StatelessWidget {
  const JsonArrayWidget({Key? key}) : super(key: key);

  final _textStyle = const TextStyle(color: Colors.white,fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FetchFutureData.readPersonJsonData(),
      builder: (context,data){

        if(data.hasError){
          return Center(
            child: Text(data.error.toString()),
          );
        }
        else if(data.hasData){
          var personData = data.data as PersonModel;
          var sportsList = personData.favGame as List<String>;
          return Container(
            margin: const EdgeInsets.all(0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
               const Image(
                 image: NetworkImage("https://media.istockphoto.com/photos/the-stadium-picture-id935338532?b=1&k=20&m=935338532&s=170667a&w=0&h=dIbkUG3ON6uG6-PMG29iffuZZpNcULINTwuftokUscc="),
                 height: double.infinity,
                 fit: BoxFit.cover,
               ),
                Positioned(
                  top: 10,
                  left: 5,
                  right: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black87.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            child: Text("Name : ${personData.name}",style: _textStyle ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          child: ListTile(
                            title:  Text('Favorite Sports',style: _textStyle,),
                            subtitle: GridView.builder(
                              itemCount: sportsList.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context,index){

                                return Card(
                                  elevation: 10,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width/2 - 10,
                                    height: 200,
                                    child: Text(sportsList[index],style: const TextStyle(color: Colors.black87,fontSize: 22,fontWeight: FontWeight.w500),),
                                  ),
                                );
                              },
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 5,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
        else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

      },
    );
  }
}
