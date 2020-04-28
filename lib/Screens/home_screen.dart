import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:ncovid19/Networking/Datacontent.dart';
import 'package:ncovid19/Screens/Global.dart';
import 'package:ncovid19/Screens/SecondScreen.dart';
import 'package:number_display/number_display.dart';
import '../Components/Reusable.dart';
class Homescreen extends StatefulWidget {
  Homescreen({this.HomeData1, this.HomeData2});
  final  HomeData1, HomeData2;
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final display = createDisplay(length: 20);
  int ontapchange = 0, ontapcase=0;
  int currentIndex = 0;
  DataModel weatherModel = DataModel();
  dynamic Data2;
  String country, getname;
  int tcases=0, acases=0, rcases=0, tdeaths=0, scases=0, ndeaths=0, ncases=0;
  int currentindex=1;
  String totald = 'Total Deaths';
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdateUi(widget.HomeData1);
  }
  void UpdateUi(dynamic wdata) {
    setState(() {
      String totalcases = wdata['data']['total_cases'];
      tcases = int.parse(totalcases);
      String activecases = wdata['data']['active_cases'];
      acases = int.parse(activecases);
      String totarecovered = wdata['data']['total_recoverd'];
      rcases=int.parse(totarecovered);
      String totaldeath = wdata['data']['total_deaths'];
      tdeaths = int.parse(totaldeath);
      ontapcase = tdeaths;
      String seriouscases = wdata['data']['serious_cases'];
      scases = int.parse(seriouscases);
      String count = wdata['data']['country'];
      country = count.toString();
      String newcases = wdata['data']['new_cases'];
      ncases = int.parse(newcases);
      String newdeaths = wdata['data']['new_deaths'];
      ndeaths = int.parse(newdeaths);
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
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed,items: [BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home',style: TextStyle(fontFamily: 'Righteous'),),),
          BottomNavigationBarItem(icon: Icon(Icons.add_location), title: Text('Country',style: TextStyle(fontFamily: 'Righteous'),),),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), title: Text('More',style: TextStyle(fontFamily: 'Righteous'),),),
        ], currentIndex: currentindex,onTap: (value){
          if(value==2){
            Navigator.push(context, PageRouteBuilder(
              pageBuilder: (_, __, ___) => Secondscreen(SecondData1: widget.HomeData1,SecondData2: widget.HomeData2,),
              transitionsBuilder: (_, anim, __, child) => FadeTransition(opacity: anim, child: child),
              transitionDuration: Duration(seconds: 0),
            ),
            );
          }
          else if(value==0){
            Navigator.push(context, PageRouteBuilder(
              pageBuilder: (_, __, ___) => Globalscreen(globaldata1: widget.HomeData2,globaldata2: widget.HomeData1,),
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
                                Navigator.pop(context); //pop dialog
                                UpdateUi(newdata);
                              })
                          ),
                        ),
                      ),
                    ],

                  ),),
                Positioned(
                  top: 30,
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
                            child: Text('      ' + '${display(ncases)}', style: TextStyle(
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
                            totald = 'Total Deaths:';
                            ontapcase = tdeaths;
                          }
                          else{
                            totald = 'New Deaths';
                            ontapcase = ndeaths;
                          }
                        });
                      },
                      child: Reusable_Card(
                        CardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(child: Text(totald, style: TextStyle(
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
