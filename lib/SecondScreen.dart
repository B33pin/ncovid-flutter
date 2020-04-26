import 'dart:math';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_screen/responsive_screen.dart';
class Secondscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var messagelist = ['hello i am here to guide you please go through symptoms and prevention', 'Hey you! how is your lockdown going? have a look at prevention!','Hello sir! have you sanitized your hand? it is must for prevention', "A wise man once said: 'United we fall divided we stand'", 'Stay home! Stay Safe!'];
    Random random = new Random();
    int randomNumber = random.nextInt(4); // from 0 upto 99 included
    final wp = Screen(context).wp; //specify wp
    final hp = Screen(context).hp;
    double c_width = MediaQuery.of(context).size.width*0.75;
    return SafeArea(child: Scaffold(
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
                        height: hp(38),
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: AssetImage('images/test.jpg'),),
                    ],
                  ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[400],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(icon: Icon(Icons.arrow_back,color: Colors.grey[300],size: 30,), onPressed: (){
                          Navigator.pop(context);
                        }),),
                    ),),
                ),
                Positioned(
                  left: 15,
                  top: 30,child: Row(
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
                    height: 13,
                  ),
                  Prevention(hei: hp(12),wei:wp(22),url: 'images/mask.png', name: 'Cover mouth and nose with mask and make sure there are no gaps between your face and the mask.',),
                  SizedBox(height: 10),
                  Prevention(hei: hp(12),wei:wp(22),url: 'images/wash.png', name: 'Wash your hands frequently Regularly with soap and water and use alcohol sanitizer',),
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
    return Container(
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
