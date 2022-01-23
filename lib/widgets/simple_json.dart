import 'package:flutter/material.dart';
import 'package:flutter_json_data_parse/model/student.dart';
import 'package:flutter_json_data_parse/static_function/fetch_future_data.dart';

class SimpleJsonWidget extends StatelessWidget {
  const SimpleJsonWidget({Key? key}) : super(key: key);

  final _textStyle =  const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FetchFutureData.readStudentJsonData(),
      builder: (context,data){
        if(data.hasError)
          {
            return Center(
              child: Text("${data.error}"),
            );
          }
        else if(data.hasData)
          {
            var studentData = data.data as StudentModel;
            return ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top:10,left: 5,right: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal.shade900,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child:  Text("Name ",style: _textStyle,) ,
                      ),
                      Expanded(
                        flex: 3,
                        child:  Text(": ${studentData.name.toString()}",style: _textStyle,) ,
                      ),
                    ],
                  ),
                  // child: Text("Name     : ${studentData.name}", style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                ),
                Container(
                  margin: const EdgeInsets.only(top:10,left: 5,right: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal.shade900,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child:  Text("ID ",style: _textStyle,) ,
                      ),
                      Expanded(
                        flex: 3,
                        child:  Text(": ${studentData.id.toString()}",style: _textStyle,) ,
                      ),
                    ],
                  ),
                  // child: Text("Name     : ${studentData.name}", style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                ),
                Container(
                  margin: const EdgeInsets.only(top:10,left: 5,right: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal.shade900,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child:  Text("Session ",style: _textStyle,) ,
                      ),
                      Expanded(
                        flex: 3,
                        child:  Text(": ${studentData.session.toString()}",style: _textStyle,) ,
                      ),
                    ],
                  ),
                  // child: Text("Name     : ${studentData.name}", style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                ),
                Container(
                  margin: const EdgeInsets.only(top:10,left: 5,right: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal.shade900,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child:  Text("Dept. ",style: _textStyle,) ,
                      ),
                      Expanded(
                        flex: 3,
                        child:  Text(": ${studentData.department.toString()}",style: _textStyle,) ,
                      ),
                    ],
                  ),
                  // child: Text("Name     : ${studentData.name}", style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                ),
                Container(
                  margin: const EdgeInsets.only(top:10,left: 5,right: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal.shade900,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child:  Text("University ",style: _textStyle,) ,
                      ),
                      Expanded(
                        flex: 3,
                        child:  Text(": ${studentData.name.toString()}",style: _textStyle,) ,
                      ),
                    ],
                  ),
                  // child: Text("Name     : ${studentData.name}", style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                ),
                Container(
                  margin: const EdgeInsets.only(top:10,left: 5,right: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal.shade900,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child:  Text("College ",style: _textStyle,) ,
                      ),
                      Expanded(
                        flex: 3,
                        child:  Text(": ${studentData.college.toString()}",style: _textStyle,) ,
                      ),
                    ],
                  ),
                  // child: Text("Name     : ${studentData.name}", style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                ),
                Container(
                  margin: const EdgeInsets.only(top:10,left: 5,right: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal.shade900,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child:  Text("email ",style: _textStyle,) ,
                      ),
                      Expanded(
                        flex: 3,
                        child:  Text(": ${studentData.email.toString()}",style: _textStyle,) ,
                      ),
                    ],
                  ),
                  // child: Text("Name     : ${studentData.name}", style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                ),
                Container(
                  margin: const EdgeInsets.only(top:10,left: 5,right: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal.shade900,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child:  Text("About ",style: _textStyle,) ,
                      ),
                      Expanded(
                        flex: 3,
                        child:  Text(": ${studentData.about.toString()}",style: _textStyle,) ,
                      ),
                    ],
                  ),
                  // child: Text("Name     : ${studentData.name}", style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                ),


              ],
            );
          }
        else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
