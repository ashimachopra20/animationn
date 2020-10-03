import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';

class MyA1 extends StatefulWidget {
  @override
  _MyA1State createState() => _MyA1State();
}

class _MyA1State extends State<MyA1> with SingleTickerProviderStateMixin {
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
      duration: Duration(seconds: 6),
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
     queryData = MediaQuery.of(context);
 var mw= queryData.size.width;
var mh=queryData.size.height;
return Scaffold(
bottomNavigationBar: BubbledNavigationBar(
  defaultBubbleColor: Colors.red,
  onTap: (index) {
     Navigator.pushNamed(context, '/news');
  },
  items: <BubbledNavigationBarItem>[
    BubbledNavigationBarItem(
      icon:       Icon(CupertinoIcons.home, size: 30, color: Colors.red),
      activeIcon: Icon(CupertinoIcons.home, size: 30, color: Colors.white),
      title: Text('Home', style: TextStyle(color: Colors.white, fontSize: 12),),
    ),
    /*
    BubbledNavigationBarItem(
      icon:       Icon(CupertinoIcons.phone, size: 30, color: Colors.purple),
      activeIcon: Icon(CupertinoIcons.phone, size: 30, color: Colors.white),
      title: Text('Phone', style: TextStyle(color: Colors.white, fontSize: 12),),
    ),
    */
    BubbledNavigationBarItem(
      icon:       Icon(CupertinoIcons.info, size: 30, color: Colors.teal),
      activeIcon: Icon(CupertinoIcons.info, size: 30, color: Colors.white),
      title: Text('Info', style: TextStyle(color: Colors.white, fontSize: 12),),
    ),
    BubbledNavigationBarItem(
      icon:       Icon(CupertinoIcons.profile_circled, size: 30, color: Colors.cyan),
      activeIcon: Icon(CupertinoIcons.profile_circled, size: 30, color: Colors.white),
      title: Text('Profile', style: TextStyle(color: Colors.white, fontSize: 12),),
    ),
  ],
),
body:
  Stack(children: <Widget>[ 
     
 Container(
   
      height: mh*animation.value,
      width: mw*animation.value,
      child:
        RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(myanicon),
              child:Image.asset('assets/im2.jpg',fit: BoxFit.cover,)
              
               
            ),
       
    ),

  Center(
    child: Container(
  decoration: BoxDecoration
  ( border:Border.all(width: 6.0, color: Colors.black),borderRadius: BorderRadius.circular(25)),
      height:50*animation1.value ,
      width:200,

      margin: EdgeInsets.only(
       bottom:(mh/2)*animation2.value/2,
      //left:mw*animation.value-mw/2
      ),
     
      child: FlatButton(
        
        color: Colors.black,

          
          onPressed: (){
           // Navigator.pushNamed(context, "/news");
          }
          ,
          padding: EdgeInsets.all(2*animation1.value),child: Text('NEWS FLASH',style: TextStyle(color:Colors.pinkAccent,fontWeight: FontWeight.bold,fontSize: 30*animation.value),),),
     
    ),
    
    
  ),
   Center(
     child: Container(
       margin: EdgeInsets.only(bottom:4*animation3.value),
       
       child: Text('WELCOME TO MY APP!',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 30*animation.value),)),
   ),
],
));
 


}}
    