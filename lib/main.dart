import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage());
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selecteditem =0;
  bool _isListVisisble = true;
  bool _isDetScreenVisisble = false;

  TabBar get _tabBar => TabBar(

    isScrollable: true,
    unselectedLabelColor: Colors.grey,
    indicatorColor: Colors.deepPurple,
    labelColor: Colors.white,

    tabs: [
      Tab(text: "Cricket",),
      Tab(text: "Football",),
      Tab(text: "Kabaddi",),
      Tab(text: "Hockey",),
      Tab(text: "Baseball",),
      Tab(text: "Tennis",),


    ],

  );


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Live",
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedIconTheme: IconThemeData(color: Colors.cyan),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.deepPurple,
            currentIndex: _selecteditem,
            selectedFontSize: 0,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(label: "",
                  icon: Icon(Icons.home_filled,size: 30,)),
              BottomNavigationBarItem(label: "",
                  icon: Icon(Icons.live_tv, size: 30,)),
              BottomNavigationBarItem(label: "",
                  icon: Icon(Icons.add_circle_outline, size: 30,)),
              BottomNavigationBarItem(label: "",
                  icon: Icon(Icons.ondemand_video_outlined, size: 30,)),
              BottomNavigationBarItem(label: "",
                  icon: Icon(Icons.calendar_today_outlined, size: 30,)),
            ],
          ),
        appBar: AppBar(
          actions: [

           !_isListVisisble ? Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.share_outlined,size: 30 ,color: Colors.deepPurpleAccent,),
            ): Text("")
            
          ],
          primary: true,
          leading: InkWell(
            onTap: (){
              setState(() {
                if(_isListVisisble){
                  print("MainActivity");

                }else{
                  print("DetailActivity");
                  _isListVisisble = true;
                  _isDetScreenVisisble = false;
                }
              });
            },
              child: Icon(Icons.arrow_back)),
          backgroundColor: Colors.indigo,

          title: Text("Live"),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: Material(
              child: _tabBar,
              color: Colors.deepPurple,
            ),
          )
        ),
        body: TabBarView(

          children: [

            //Tab1
            Container(
              color: Colors.deepPurpleAccent,
            //  height: MediaQuery.of(context).size.height,
              //width: MediaQuery.of(context).size.width,
              child: Stack(

                children: [

                  Visibility(
                    visible: _isListVisisble,

                    child: ListView.builder(
                      itemCount: 4,
                        itemBuilder: (BuildContext context, int index){
                        return InkWell(
                          onTap:(){

                            setState(() {
                              _isListVisisble = false;
                              _isDetScreenVisisble = true;
                            });


                             //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("OnTap Call"),duration: Duration.zero,));
                          },

                          child: Container(
                           // height: 250,
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0.0, 3.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                              borderRadius: BorderRadius.circular(16.0),
                              color: Colors.indigo
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                      child: Text("India Tour Of West Indies,2nd T20",
                                        style: TextStyle(color: Colors.white,),
                                      ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 5),
                                      child: Text("Live", style: TextStyle(color: Colors.deepOrangeAccent),
                                      ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  Divider(
                                    height:1,color: Colors.deepPurpleAccent,thickness: 3,

                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [

                                        Column(
                                          children: [
                                            Container(
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5.0),
                                                    color: Colors.white,
                                              shape: BoxShape.rectangle
                                            ),
                                                child: Image.asset("assets/images/westindies.png",height: 40,width: 40,)),
                                            Container(padding: EdgeInsets.all(2),
                                              child: Text("West Indies",style: TextStyle(color: Colors.white,fontSize: 12),),),
                                            Container(child: Row(
                                              children: [
                                                Text("193/5",style: TextStyle(color: Colors.white,fontSize: 25),),

                                                Padding(
                                                  padding: const EdgeInsets.only(left:3, top: 4.0),
                                                  child: Text("(20)",style: TextStyle(color: Colors.white,fontSize: 12),),
                                                ),
                                              ],
                                            ),),
                                          ],
                                        ),
                                        Column(

                                          children: [
                                            Container(child: Text("VS", style: TextStyle(color: Colors.white,fontSize: 18),),)
                                          ],
                                        ),
                                        Column(
                                          children: [
                                          Container(
                                            height: 42,
                                           // width: 42,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.0),
                                              color: Colors.white,
                                            ),
                                              child: Image.asset("assets/images/indianflag.png",height: 40,width: 40,)),

                                            Container(padding: EdgeInsets.all(2),
                                              child: Text("India",style: TextStyle(color: Colors.white,fontSize: 12),),),

                                            Container(child: Row(
                                              children: [
                                                Text("93/2",style: TextStyle(color: Colors.white,fontSize: 25),),

                                                Padding(
                                                  padding: const EdgeInsets.only(left:3, top: 4.0),
                                                  child: Text("(10.2)",style: TextStyle(color: Colors.white,fontSize: 12),),
                                                ),
                                              ],
                                            ),),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),

                                  Center(
                                    child: Container(
                                      child: Text("India Need 100 Runs To Win", style: TextStyle(fontSize: 15,color: Colors.white,),),
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text("West Indies", style: TextStyle(color: Colors.white, fontSize: 10),),
                                          ),
                                          Container(
                                            child: Text("35%", style: TextStyle(color: Colors.red,fontSize: 10),),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text("India", style: TextStyle(color: Colors.white, fontSize: 10),),
                                          ),
                                          Container(
                                            child: Text("65%", style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 10),),
                                          )
                                        ],
                                      ),

                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0,bottom: 3),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: LinearProgressIndicator(

                                        minHeight: 8,
                                        value: 0.35,
                                        color: Colors.red,
                                        backgroundColor: Colors.indigoAccent,
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                        );

                        }
                    ),
                  ),

                  Visibility(

                    visible: _isDetScreenVisisble,

                      child: Column(
                        children: [
                          Container(
                            height: 220,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0.0, 3.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                              color: Colors.indigo
                            ),



                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(

                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text("India Tour Of West Indies,2nd T20",
                                            style: TextStyle(color: Colors.white,fontSize: 15),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          child: Text("Live", style: TextStyle(color: Colors.deepOrangeAccent),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  Divider(
                                    height:1,color: Colors.deepPurpleAccent,thickness: 3,
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0, top: 10, bottom: 8  ),
                                    child: Row(
                                      children: [
                                        Column(
                                        children: [
                                          Container(
                                            height: 42,
                                            alignment: Alignment.bottomCenter,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(5.0)
                                            ),
                                              child: Image.asset("assets/images/indianflag.png",height: 40, width: 40,))
                                        ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,

                                          children: [
                                            Container(
                                              child: Text("India", style: TextStyle(color: Colors.white),),
                                            ),

                                            Container(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Row(
                                              children: [
                                                Text("93/2",style: TextStyle(color: Colors.orangeAccent,fontSize: 23),),

                                                Padding(
                                                  padding: const EdgeInsets.only(left:3, top: 4.0),
                                                  child: Text("(10.2)",style: TextStyle(color: Colors.white,fontSize: 12),),
                                                ),
                                              ],
                                            ),)
                                          ],
                                        ),


                                      ],
                                    ),
                                  ),

                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurpleAccent
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 0.0, left: 8.0,right: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text("CRR:9.26   CRR:10", style: TextStyle(color: Colors.white),),
                                          ),
                                          Container(
                                            child: Text("Target:101", style: TextStyle(color: Colors.white),),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text("India Need 100 Runs To Win", style: TextStyle(fontSize: 15,color: Colors.orangeAccent,),),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text("West Indies", style: TextStyle(color: Colors.white, fontSize: 10),),
                                            ),
                                            Container(
                                              child: Text("35%", style: TextStyle(color: Colors.red,fontSize: 10),),
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text("India", style: TextStyle(color: Colors.white, fontSize: 10),),
                                            ),
                                            Container(
                                              child: Text("65%", style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 10),),
                                            )
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0,bottom: 0,left: 8.0, right: 8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: LinearProgressIndicator(

                                        minHeight: 8,
                                        value: 0.35,
                                        color: Colors.red,
                                        backgroundColor: Colors.indigoAccent,
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),

                          ),
                          
                          //Listview of Over

                          Container(

                            margin: EdgeInsets.only(top: 16),
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Center(child: Text("Over 10", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(99.0), color: Colors.indigo),
                                    child: Text("1", style: TextStyle(color: Colors.white),),),

                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(99.0), color: Colors.indigo),
                                    child: Text("6", style: TextStyle(color: Colors.white),),),

                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(99.0), color: Colors.indigo),
                                    child: Text("1", style: TextStyle(color: Colors.white),),),

                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(99.0), color: Colors.indigo),
                                    child: Text("1", style: TextStyle(color: Colors.white),),),

                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(99.0), color: Colors.red),
                                    child: Text("W", style: TextStyle(color: Colors.white),),),

                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(99.0), color: Colors.indigo),
                                    child: Text("1", style: TextStyle(color: Colors.white),),),

                                  Container(margin: EdgeInsets.only(left: 5,right: 5),
                                      child: Center
                                        (child: Text("= 10",style: TextStyle(color: Colors.white, fontSize: 16),))),

                                  VerticalDivider(

                                    thickness: 2,
                                    color: Colors.indigo,
                                  ),


                                  // 2nd Over
                                  Center(child: Text("Over 11", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(99.0), color: Colors.indigo),
                                    child: Text("4", style: TextStyle(color: Colors.white),),),

                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(99.0), color: Colors.indigo),
                                    child: Text("6", style: TextStyle(color: Colors.white),),),

                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(99.0), color: Colors.indigo),
                                    child: Text("0", style: TextStyle(color: Colors.white),),),

                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(99.0), color: Colors.indigo),
                                    child: Text("1", style: TextStyle(color: Colors.white),),),

                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(99.0), color: Colors.red),
                                    child: Text("W", style: TextStyle(color: Colors.white),),),

                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(99.0), color: Colors.indigo),
                                    child: Text("1", style: TextStyle(color: Colors.white),),),

                                  Container(margin: EdgeInsets.only(left: 5),
                                      child: Center
                                        (child: Text("= 20",style: TextStyle(color: Colors.white, fontSize: 16),)))

                                ],
                              ),
                            ),
                          ),
                          
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 5),
                            height: 200,
                            decoration: BoxDecoration(color: Colors.indigo),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("Batter", style: TextStyle(color: Colors.white),),
                                      ),
                                      Container(
                                        child: Text("R(B)  4s  6s  SR", style: TextStyle(color: Colors.white, fontSize: 16),),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text("Rohit Sharma", style: TextStyle(color: Colors.white),),
                                        ),
                                        Container(
                                          child: Text("25(14)  2  1  1.77", style: TextStyle(color: Colors.white, fontSize: 14),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("Ishan Kisan", style: TextStyle(color: Colors.white),),
                                      ),
                                      Container(
                                        child: Text("2(5)  0  0  0.4", style: TextStyle(color: Colors.white, fontSize: 16),),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text("P'ship27(19)", style: TextStyle(color: Colors.white,fontSize: 10),),
                                        ),
                                        Container(
                                          child: Text("Last Wkt:Obed McCopy", style: TextStyle(color: Colors.white, fontSize: 8),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("Bowler", style: TextStyle(color: Colors.white,),),
                                      ),
                                      Container(
                                        child: Text("W-R  Overs  Econ", style: TextStyle(color: Colors.white, fontSize: 14),),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text("Alzarri Joseph", style: TextStyle(color: Colors.white,),),
                                        ),
                                        Container(
                                          child: Text("1-13   6.0   2.77", style: TextStyle(color: Colors.white, fontSize: 16 ),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ),

                          Container(
                          //  height: 150,
                           // width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                              color: Colors.indigo
                            ),
                            child: Column(
                              children: [

                                Container(
                                  margin: EdgeInsets.all(10),
                                  
                                  child: Text("Who Will Win ?", style: TextStyle(color: Colors.white, fontSize: 20),),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          shape: BoxShape.rectangle,
                                          color: Colors.indigo,
                                          border: Border.all(color: Colors.white)
                                        ),
                                        width: 80,
                                        height: 20,
                                        child: Center(child: Text("WI", style: TextStyle(color: Colors.white),)),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          shape: BoxShape.rectangle,
                                          color: Colors.indigo,
                                          border: Border.all(color: Colors.white)
                                        ),
                                        width: 80,
                                        height: 20,
                                        child: Center(child: Text("IND", style: TextStyle(color: Colors.white),)),
                                      ),
                                    ],
                                  ),
                                )

                              ],
                            ),
                          )
                        ],
                      )
                  ),
                ],
              ),
            ),

            Center(
              child: Container(
                child: Text("Football"),
              ),
            ),

          Center(
              child: Container(
                child: Text("Kabaddi"),
              ),
            ),

          Center(
              child: Container(
                child: Text("Hockey"),
              ),
            ),

          Center(
              child: Container(
                child: Text("Baseball"),
              ),
            ),

          Center(
              child: Container(
                child: Text("Tennis"),
              ),
            ),

          ]

        ),
         // This trailing comma makes auto-formatting nicer for build methods.
    ),
      ),
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _selecteditem = index;
    });
  }
}
