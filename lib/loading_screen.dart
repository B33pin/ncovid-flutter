import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ncovid19/Global.dart';

import 'Datacontent.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.black,
          size: 100.0,
        ),
      ),
    );
  }

  void getdata() async{
    var weatherdata = await DataModel().getglobaldata();
    var weatherdata2 = await DataModel().getcountrydata();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Globalscreen(globaldata1: weatherdata,globaldata2: weatherdata2,);
    }));
  }
}
