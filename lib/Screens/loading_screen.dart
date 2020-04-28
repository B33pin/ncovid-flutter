import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ncovid19/Screens/Global.dart';

import '../Networking/Datacontent.dart';
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
      backgroundColor: Colors.grey[300],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: SpinKitFadingCircle(
                    color: Colors.black,
                    size: 100.0,
                  ),
                ),
                SizedBox(height: 10,),
                Text('Loading', style: TextStyle(
                  fontFamily: 'Righteous', fontSize: 25
                ),),
              ],
            ),
          ),
          Text('Note: You can tap on total deaths to see new deaths',style: TextStyle(
            fontSize: 14, fontFamily: 'Righteous'
          ),),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  void getdata() async{
    var InitialData = await DataModel().getglobaldata();
    var InitialData2 = await DataModel().getcountrydata();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Globalscreen(globaldata1: InitialData,globaldata2: InitialData2,);
    }));
  }
}
