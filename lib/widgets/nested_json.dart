

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_data_parse/model/employee.dart';
import 'package:flutter_json_data_parse/static_function/fetch_future_data.dart';

class NestedJsonWidget extends StatelessWidget {
  const NestedJsonWidget({Key? key}) : super(key: key);
  final textStyle = const TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FetchFutureData.readEmployeeJsonData(),
      builder: (context,nestedData){
        if(nestedData.hasError){
          return Center(child: Text(nestedData.error.toString()),);
        }
        else if(nestedData.hasData){
          var employeeData = nestedData.data as EmployeeModel;
          return ListView(
            children: [
              Card(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Text('Employee Name : ${employeeData.name}',style: textStyle,),
                ),
              ),
              const SizedBox(height: 10,),
              Card(
                elevation: 10,
                child: Column(
                  children: [

                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade900,
                      ),
                      child: const Text('Home Address',style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w500),),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 10,bottom: 5),
                          child: Text('Street : ${employeeData.homeAddress!.street}',style: textStyle),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('City : ${employeeData.homeAddress!.city}',style: textStyle,),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Zip-Code : ${employeeData.homeAddress!.zipcode}',style: textStyle,),
                        ),
                        const SizedBox(height: 10,),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Card(
                elevation: 10,
                child: Column(
                  children: [

                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade900,
                      ),
                      child: const Text('Business Address',style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w500),),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 10,bottom: 5),
                          child: Text('Street : ${employeeData.businessAddress!.street}',style: textStyle),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('City : ${employeeData.businessAddress!.city}',style: textStyle,),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Zip-Code : ${employeeData.businessAddress!.zipcode}',style: textStyle,),
                        ),
                        const SizedBox(height: 10,),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        }
        else{
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

