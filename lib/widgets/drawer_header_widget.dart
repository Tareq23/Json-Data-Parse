
import 'package:flutter/material.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: DrawerHeader(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xff4a148c),
                Color(0xff880e4f),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,

            )
        ),
        child:  Column(
          children:  [
            Container(
                width: 150,
                height: 200,
                margin: const EdgeInsets.all(10),
                child: const Image(
                  image: AssetImage('json-icon.png'),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  color: Colors.white,
                )
            ),
            const SizedBox(height: 20,),
            const Text('JSON Data Parsed',style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w700),),
          ],
        ),
      ),
    );
  }
}
