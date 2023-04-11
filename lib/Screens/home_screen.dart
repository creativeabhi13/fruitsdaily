import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruitsdaily/data/data.dart';

import 'package:fruitsdaily/utils/colors.dart';

import '../utils/utils.dart';
import 'package:flutter/services.dart' as rootBundle;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required product});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List _items = [];

  Future<List<ProductDataModel>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('assests/product.json');
    final list=json.decode(jsondata) as List<dynamic>;

    return list.map((e) =>ProductDataModel.fromJson(e)).toList();



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // top container
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: kSecondaryColor,
                    backgroundImage: AssetImage("assets/user.png"),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Welcome back,",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Abhishek Kumar",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  iconWidget(FontAwesomeIcons.bagShopping, true),
                ],
              ),
              const SizedBox(height: 30),

              // tagline
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Get your fresh items \n",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "with ",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "Fruits Markets",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),


             FutureBuilder(future: ReadJsonData(),
            builder: (context,data){
               if(data.hasError){
                  return Center(child: Text("${data.error}"));
                }
               else if(data.hasData)
                 {
                   var items =data.data as List<ProductDataModel>;
                   return ListView.builder(
                       itemCount: items == null? 0: items.length,
                       itemBuilder: (context,index){
                         return Card(
                           elevation: 5,
                           margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                           child: Container(
                             padding: EdgeInsets.all(8),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Container(
                                   width: 50,
                                   height: 50,
                                   child: Image(image: NetworkImage(items[index].p_imageURL.toString()),fit: BoxFit.fill,),
                                 ),
                                 Expanded(child: Container(
                                   padding: EdgeInsets.only(bottom: 8),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].p_name.toString(),style: TextStyle(
                                           fontSize: 16,
                                           fontWeight: FontWeight.bold
                                       ),),),
                                       Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].p_cost.toString()),)
                                     ],
                                   ),
                                 ))
                               ],
                             ),
                           ),
                         );
                       }
                   );
                 }
               else
                   {
                     return Center(child:CircularProgressIndicator(),);
                   }

               },
             ),


              // product grid view

            ],
          ),
        ),
      ),
    );
  }
}


