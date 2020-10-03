import 'package:flutter/material.dart';
import 'MyAnim.dart';

import 'news.dart';
import 'Newws.dart';



void main() {
  

  runApp(MaterialApp(
    
 
      initialRoute: "/",
    routes: {
     "/news":(context)=> MyApp(),
      "/":(context)=> Mynews(),
    
  

    },
    debugShowCheckedModeBanner: false,
  ));
}

