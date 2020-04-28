import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:ncovid19/Networking/Datacontent.dart';
import 'package:ncovid19/Screens/home_screen.dart';
import 'package:number_display/number_display.dart';
import '../Components/Reusable.dart';
import 'SecondScreen.dart';

class Globalscreen extends StatefulWidget {
  Globalscreen({this.globaldata1, this.globaldata2});
  final  globaldata1, globaldata2;
  @override
  _GlobalscreenState createState() => _GlobalscreenState();
}

class _GlobalscreenState extends State<Globalscreen> {
  final display = createDisplay(length: 20);
  DataModel weatherModel = DataModel();
  String country, getname;
  String totaldeaths = 'Total Deaths:';
  int tcases=0, acases=0, rcases=0, tdeaths=0, scases=0, ncase =0, currentindex=0, ndeaths=0;
  int ontapchange = 0, ontapcase=0;
@override
  void initState() {
    super.initState();
    updateui(widget.globaldata1);
  }
  void updateui(dynamic wdata) {
    setState(() {
      int totalcases = wdata['results'][0]['total_cases'];
      tcases = totalcases;
      int activecases = wdata['results'][0]['total_active_cases'];
      acases = activecases;
      int totarecovered = wdata['results'][0]['total_recovered'];
      rcases=totarecovered;
      int totaldeath = wdata['results'][0]['total_deaths'];
      tdeaths = totaldeath;
      int seriouscases = wdata['results'][0]['total_serious_cases'];
      scases = seriouscases;
      int newcase = wdata['results'][0]['total_new_cases_today'];
      ncase = newcase;
      int newdeaths = wdata['results'][0]['total_new_deaths_today'];
      ndeaths = newdeaths;
      ontapcase = tdeaths;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed,items: [BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home',style: TextStyle(fontFamily: 'Righteous'),),),
          BottomNavigationBarItem(icon: Icon(Icons.add_location), title: Text('Country',style: TextStyle(fontFamily: 'Righteous'),),),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), title: Text('More',style: TextStyle(fontFamily: 'Righteous'),),),
        ], currentIndex: currentindex,onTap: (value){
          if(value==1){
            Navigator.push(context, PageRouteBuilder(
              pageBuilder: (_, __, ___) => Homescreen(HomeData1: widget.globaldata2,HomeData2: widget.globaldata1,),
              transitionsBuilder: (_, anim, __, child) => FadeTransition(opacity: anim, child: child),
              transitionDuration: Duration(seconds: 0),
            ),
            );
          }
          if(value==2){
            Navigator.push(context, PageRouteBuilder(
              pageBuilder: (_, __, ___) => Secondscreen(SecondData1: widget.globaldata2,SecondData2: widget.globaldata1,),
              transitionsBuilder: (_, anim, __, child) => FadeTransition(opacity: anim, child: child),
              transitionDuration: Duration(seconds: 0),
            ),
            );
          }
          currentindex = value;
        },),
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
                    ],

                  ),),
                Positioned(
                  top: 30,
                  left: 10,
                  child: Column(
                    children: <Widget>[
                      Text('Global', style: TextStyle(
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
                            child: Text('      ' + '${display(tcases)}', style: TextStyle(
                              fontSize: 45,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Righteous',
                            ),),
                          ),
                          Center(child: Text('  Total Cases',
                            style: TextStyle(color: Colors.white, fontFamily: 'Righteous'),)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Center(
                            child: Text('      + ' + '${display(ncase)}', style: TextStyle(
                              fontSize: 40,
                              color: Colors.red[400],
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Righteous',
                            ),),
                          ),
                          Center(child: Text('  New Cases',
                            style: TextStyle(color: Colors.red[400], fontFamily: 'Righteous'),)),
                        ],
                      )
                    ],
                  ),),
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
                          Text('${display(acases)}', style: TextStyle(
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
                          Text('${display(rcases)}', style: TextStyle(
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
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          ontapchange = ontapchange+1;
                          if(ontapchange%2==0){
                            totaldeaths = 'Total Deaths';
                            ontapcase = tdeaths;
                          }
                          else{
                            totaldeaths = 'New Deaths';
                            ontapcase = ndeaths;
                          }
                        });
                      },
                      child: Reusable_Card(
                        CardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(child: Text(totaldeaths, style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontFamily: 'Righteous'
                            ),)),
                            SizedBox(
                              height: 15,
                            ),
                            Text('${display(ontapcase)}', style: TextStyle(
                                fontSize: 30,
                                color: Colors.red,
                                fontFamily: 'Righteous'
                            ),)
                          ],
                        ),
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
                          Text('${display(scases)}', style: TextStyle(
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
