import 'dart:math';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ncovid19/Screens/Global.dart';
import 'package:ncovid19/Screens/home_screen.dart';
import 'package:responsive_screen/responsive_screen.dart';
class Secondscreen extends StatelessWidget {
  Secondscreen({this.SecondData1, this.SecondData2});
  final  SecondData1, SecondData2;
  int currentindex=2;
  @override
  Widget build(BuildContext context) {
    var messagelist = ['hello i am here to guide you please go through symptoms and prevention', 'Hey you! how is your lockdown going? have a look at prevention!','Hello sir! have you sanitized your hand? it is must for prevention', "A wise man once said: 'United we fall divided we stand'", 'Stay home! Stay Safe!'];
    Random random = new Random();
    int randomNumber = random.nextInt(4); // from 0 upto 99 included
    final wp = Screen(context).wp; //specify wp
    final hp = Screen(context).hp;
    double c_width = MediaQuery.of(context).size.width*0.75;
    return SafeArea(child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed,items: [BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home',style: TextStyle(fontFamily: 'Righteous'),),),
        BottomNavigationBarItem(icon: Icon(Icons.add_location), title: Text('Country',style: TextStyle(fontFamily: 'Righteous'),),),
        BottomNavigationBarItem(icon: Icon(Icons.add_box), title: Text('More',style: TextStyle(fontFamily: 'Righteous'),),),
      ], currentIndex: currentindex,onTap: (value){
        if(value==1){
          Navigator.push(context, PageRouteBuilder(
            pageBuilder: (_, __, ___) => Homescreen(HomeData1: SecondData1,HomeData2: SecondData2,),
            transitionsBuilder: (_, anim, __, child) => FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(seconds: 0),
          ),
          );
        }
        else if(value==0){
          Navigator.push(context, PageRouteBuilder(
            pageBuilder: (_, __, ___) => Globalscreen(globaldata1: SecondData2,globaldata2: SecondData1,),
            transitionsBuilder: (_, anim, __, child) => FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(seconds: 0),
          ),
          );
        }
        currentindex = value;
      },),
      backgroundColor: Colors.white,
      body: Container(
        height: hp(100),
        width: wp(100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  child: ColumnSuper(
                    innerDistance: -20.0,
                    children: <Widget>[
                      Image(
                        height: hp(35),
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: AssetImage('images/test.jpg'),),
                    ],
                  ),),
                Positioned(
                  left: 15,
                  top: 20,child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(height: hp(30),image: AssetImage('images/hello.png',),),
                  Container (
                    padding: EdgeInsets.only(right: 100, left: 2),
                    width: c_width,
                    child:  Column (
                      children: <Widget>[
                         Text (messagelist[randomNumber].toString(), textAlign: TextAlign.left, style: TextStyle(
                           fontSize: 20, fontFamily: 'Righteous', color: Colors.white
                         ),),
                      ],
                    ),
                  ),
                    ],
                  ),),
              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Symptoms:', style: TextStyle(
                      color: Colors.black, fontFamily: 'Righteous', fontSize: 20
                  ),),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: <Widget>[
                      Symptoms(url: 'images/head.png', name: 'Headache',hei: hp(11),),
                      SizedBox(
                        width: 10,
                      ),
                      Symptoms(url: 'images/cough.png', name: 'Cough',hei: hp(11),),
                      SizedBox(
                        width: 10,
                      ),
                      Symptoms(url: 'images/fever.png', name: 'Fever',hei: hp(11),),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20.0, right: 20, top: 25, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Prevention:', style: TextStyle(
                      color: Colors.black, fontFamily: 'Righteous', fontSize: 20
                  ),),
                  SizedBox(
                    height: 2,
                  ),
                  Prevention(hei: hp(10),wei:wp(22),url: 'images/mask.png', name: 'Cover mouth and nose with mask and make sure there are no gaps between your face and the mask.',),
                  SizedBox(height: 10),
                  Prevention(hei: hp(10),wei:wp(22),url: 'images/wash.png', name: 'Wash your hands frequently Regularly with soap and water and use alcohol sanitizer',),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class Symptoms extends StatelessWidget {
  Symptoms({this.url, this.name, this.hei});
  String url;
  String name;
  double hei;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[100],
        boxShadow:[ BoxShadow(
          offset: Offset(0, 10),
          color: Colors.grey[400],
          blurRadius: 20,
        ),],
      ),
      child: Column(
        children: <Widget>[
          Image(height: hei,image: AssetImage(url),),
          Text(name, style: TextStyle(
            fontFamily: 'Righteous', fontSize: 17
          ),)
        ],
      ),
    );
  }
}

class Prevention extends StatelessWidget {
  Prevention({this.url, this.name, this.hei, this.wei});
  String url;
  String name;
  double hei;
  double wei;
  @override
  Widget build(BuildContext context) {
    double cwidth = MediaQuery.of(context).size.width*0.5;
    double height = MediaQuery.of(context).size.height*0.132;
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[100],
      ),
      child: Row(
        children: <Widget>[
          Container(width: wei,decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[100],
            boxShadow:[ BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey[400],
              blurRadius: 20,
            ),],
          ),child: Image(height: hei,image: AssetImage(url),)),
          SizedBox(width: 30,),
          Container (
            margin: EdgeInsets.symmetric(vertical: 15),
            padding: EdgeInsets.only(left: 2),
            width: cwidth,
            child:  Column (
              children: <Widget>[
                Text (name, textAlign: TextAlign.left, style: TextStyle(
                    fontSize: 15, fontFamily: 'Righteous', color: Colors.black
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
