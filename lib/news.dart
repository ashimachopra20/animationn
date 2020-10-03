import 'dart:convert';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




 class MyApp extends StatelessWidget {
   var q1;
   @override
  
   Widget build(BuildContext context) {
     myWeb() async {
  var url="http://newsapi.org/v2/top-headlines?country=in&apiKey=0511c6ba97e74d5ba14198982186f6df";
  var r= await http.get(url);
  var data=r.body;
  var fdata=jsonDecode(data);
  q1=fdata['articles'][0]['author'];
  print(q1);
}
var src="https://images.unsplash.com/photo-1579003593419-98f949b9398f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60";
 
     return  Scaffold(
         appBar:AppBar(title:Center(child: Text("NEWS UPDATES")),backgroundColor: Colors.blueGrey,),
         body: Stack(
           children: <Widget>[
            Container(
              height:double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/cyberpunk.jpg',
              ),
            ),       
             //Card(child: Image.network(src),),
             Center(child: Card(child: Text("nrnjn"),color: Colors.greenAccent,)),
             // FlatButton(child: Text('CLICK HERE'),onPressed: myWeb,),
           ],
         ),

       
       
     );
   }
 }