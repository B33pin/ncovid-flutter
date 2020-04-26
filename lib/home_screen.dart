import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:ncovid19/SecondScreen.dart';
import 'package:ncovid19/Datacontent.dart';
import 'Reusable.dart';
class Homescreen extends StatefulWidget {
  Homescreen({this.Dataa});
  final  Dataa;
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  DataModel weatherModel = DataModel();
  dynamic Data2;
  String country, getname;
  String tcases='null', acases='null', rcases='null', tdeaths='null', scases='null';
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdateUi(widget.Dataa);
  }
  void UpdateUi(dynamic wdata) {
    setState(() {
      String totalcases = wdata['data']['total_cases'];
      print(totalcases);
      tcases = totalcases.toString();
      String activecases = wdata['data']['active_cases'];
      acases = activecases.toString();
      String totarecovered = wdata['data']['total_recoverd'];
      rcases=totarecovered.toString();
      String totaldeath = wdata['data']['total_deaths'];
      tdeaths = totaldeath.toString();
      String seriouscases = wdata['data']['serious_cases'];
      scases = seriouscases.toString();
      String count = wdata['data']['country'];
      country = count.toString();
    });
  }
  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child:  Container(
            height: 80,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 CircularProgressIndicator(),
                 SizedBox(width: 40),
                 Center(child: Text('Loading', style: TextStyle(fontSize: 20, fontFamily: 'Righteous'),),),
              ],
            ),
          ),
        );
      },
    );
     Future.delayed(new Duration(seconds: 4), () {
      Navigator.pop(context); //pop dialog
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  child: ColumnSuper(
                    innerDistance: -20.0,
                    children: <Widget>[
                      Image(
                        height: 330,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: AssetImage('images/test.jpg'),),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: TextField(
                          onChanged: (value) {
                            getname = value;
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.grey[100],
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(width: 0.8,
                                    color: Colors.deepOrangeAccent),),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(width: 0.8),),
                              hintText: 'Enter Country Name',
                              prefixIcon: IconButton(icon: Icon(
                                Icons.refresh, size: 30.0,
                                color: Colors.black54,), onPressed: () {}),
                              suffixIcon: IconButton(icon: Icon(
                                Icons.search, size: 30.0,
                                color: Colors.black54,), onPressed: () async{
                                FocusScope.of(context).requestFocus(new FocusNode());
                                _onLoading();
                                var newdata = await DataModel().getspecificcountrydata(getname);
                                UpdateUi(newdata);
                              })
                          ),
                        ),
                      ),
                    ],

                  ),),
                Positioned(
                  top: 60,
                  left: 30,
                  child: Column(
                    children: <Widget>[
                      Text(country, style: TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Righteous',
                      ),),
                      SizedBox(
                        height: 10,
                        width: 340,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Center(
                            child: Text('      ' + tcases, style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Righteous',
                            ),),
                          ),
                          Center(child: Text('  Total Cases',
                            style: TextStyle(color: Colors.white),)),
                        ],
                      )
                    ],
                  ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurple[400],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IconButton(icon: Icon(Icons.arrow_forward,color: Colors.grey[300],size: 30,), onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return Secondscreen();
                            }));
                          }),),),
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Reusable_Card(
                      CardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(child: Text('Active Cases:', style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Righteous'
                          ),)),
                          SizedBox(
                            height: 15,
                          ),
                          Text(acases, style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontFamily: 'Righteous'
                          ),)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Reusable_Card(
                      CardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(child: Text(
                            'Total Recovered:', style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontFamily: 'Righteous'
                          ),)),
                          SizedBox(
                            height: 15,
                          ),
                          Text(rcases, style: TextStyle(
                              fontSize: 30,
                              color: Colors.green,
                              fontFamily: 'Righteous'
                          ),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Reusable_Card(
                      CardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(child: Text('Total Deaths:', style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontFamily: 'Righteous'
                          ),)),
                          SizedBox(
                            height: 15,
                          ),
                          Text(tdeaths, style: TextStyle(
                              fontSize: 30,
                              color: Colors.red,
                              fontFamily: 'Righteous'
                          ),)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Reusable_Card(
                      CardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(child: Text('Serious Cases:', style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontFamily: 'Righteous'
                          ),)),
                          SizedBox(
                            height: 15,
                          ),
                          Text(scases, style: TextStyle(
                              fontSize: 30,
                              color: Colors.blue,
                              fontFamily: 'Righteous'
                          ),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
