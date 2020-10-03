import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Mynews extends StatefulWidget {
  @override
  _MynewsState createState() => _MynewsState();
}

class _MynewsState extends State<Mynews>
    with SingleTickerProviderStateMixin {
 
 var myanicon;
  var animation;
  var animation1;
   var animation2;
     var animation3;
  MediaQueryData queryData;
  

  

  @override
  void initState() {
    super.initState();
    myanicon = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    print(myanicon);

    animation = CurvedAnimation(parent: myanicon, curve: Curves.easeInOutCirc);
    animation1=CurvedAnimation(parent: myanicon, curve: Curves.elasticOut);
    animation2=CurvedAnimation(parent: myanicon, curve: Curves.elasticOut);
    animation3=CurvedAnimation(parent: myanicon, curve: Curves.bounceOut)
      ..addListener(() {
        setState(() {
          print(animation.value);
          print(animation1.value);
           print(animation2.value);
            print(animation3.value);
        });
      });
      

    //print(animation);

    myanicon.forward();
   // print(myanicon);
  }

  @override
  void dispose() {
    super.dispose();
    myanicon.dispose();
  }

  @override
  Widget build(BuildContext context) {
     myWeb() async {
  var url="http://newsapi.org/v2/top-headlines?country=in&apiKey=0511c6ba97e74d5ba14198982186f6df";
  var r= await http.get(url);
  var data=r.body;
  var fdata=jsonDecode(data);
  print(fdata['articles'][0]['author']);
  
}
     queryData = MediaQuery.of(context);
 var mw= queryData.size.width;
var mh=queryData.size.height;
return Scaffold(
  appBar: AppBar(
    title:Center(child: Text('NEWS UPDATE')),
    backgroundColor: Colors.black,
  ),

 body: Stack(children: <Widget>[ 
     
 
    ListView(
  // This next line does the trick.
  scrollDirection: Axis.horizontal,
  children: <Widget>[
   
    Container(
      width: mw,
      height:30.0,
      color: Colors.black,
       child:
       RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(myanicon),child:Stack(
                children: <Widget>[
                  Image.asset('assets/pexels-pixabay-414860.jpg',fit: BoxFit.cover,),
                //  Card(child:Text('hello'))
                ],)
    
              
               
            ),
    ),
    Container(
      width: mw*animation2.value,
      height:30.0,
      color: Colors.black,
      child:
       
        RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(myanicon),
              child:Stack(
                children: <Widget>[
                  Image.asset('assets/pexels-pixabay-414860.jpg',fit: BoxFit.cover,),
                  Card(child:Container(
                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(25)),
                    child: Stack(children:<Widget>[RaisedButton(onPressed: (){
                    Navigator.pushNamed(context,'/news');
                  }),
                ]))
                  )],
              )
              
               
            ),
            
    ),
   
    /*
    Container(
      width: 160.0,
      color: Colors.orange,
    ),
  ],
),
     Center(
       child: Container(
         decoration: BoxDecoration
  ( border:Border.all(width: 10.0, color: Colors.black),borderRadius: BorderRadius.circular(25)),
 //  color:Colors.blueAccent,
        height: mh*animation.value/5*2.5,
        width: mw*animation.value/5*2.5,
        child:
          RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(myanicon),
                child:Card(child: Text('Click'))
                
                 
              ),
         
    ),
    
     ),
     */
     

  
    
    
  
 ]),],));

 


}}