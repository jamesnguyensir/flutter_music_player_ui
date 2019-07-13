import 'package:flutter/material.dart';
import 'package:fluttery_seekbar/fluttery_seekbar.dart';
import 'dart:math';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Music Player'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double _thumPercent = 0.4;

  Widget _buildRadialSeekBar(){
      return RadialSeekBar(
        trackColor: Colors.red.withOpacity(.5),
        trackWidth: 2.0,
        progressColor: Color(0xFF0FAAFF),
        progressWidth: 5.0,
        thumbPercent: _thumPercent,
        thumb: CircleThumb(
          color: Color(0xFF0FAAFF),
          diameter: 20.0,
        ),
        progress: _thumPercent,
        onDragUpdate: (double percent){
          setState((){
            _thumPercent = percent;
          });
        },
      );
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.8,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF0FAAFF)),
          onPressed: (){},
        ),
        title: Text(
            widget.title,
          style: TextStyle(color: Color(0xFF0FAAFF), fontFamily: "Nexa")
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.menu, color: Color(0xFF0FAAFF)),
              onPressed: () {},
          )
        ],
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 25.0,
              ),
              Center(
                child: Container(
                  width:250.0,
                  height: 250.0,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF0FAAFF).withOpacity(.5),
                            shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: _buildRadialSeekBar(),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 200.0,
                          height: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ClipOval(
                              clipper: MClipper(),
                              child: Image.asset(
                                "assets/images/oo.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.0,),
              Column(
                children: <Widget>[
                  Text("Justin Bieber fit. Never say", style:TextStyle(
                      color: Color(0xFF0FAAFF),
                      fontSize: 20.0,
                      fontFamily: "Nexa"
                  )),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "The Weekend",
                    style: TextStyle(
                        color: Color(0xFF0FAAFF),
                        fontSize: 18.0,
                        fontFamily: "NexaLight"
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0,),
              Container(
                width: 350.0,
                height: 150.0,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child:Container(
                        height: 65.0,
                        width: 290.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF0FAAFF), width: 3.0),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                  Icons.fast_forward,
                                  size:55.0,
                                  color:Color(0xFF0FAAFF)
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Icon(
                                  Icons.fast_forward,
                                  size:55.0,
                                  color:Color(0xFF0FAAFF)
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 92.0,
                        height: 92.0,
                        decoration: BoxDecoration(
                            color: Color(0xFF0FAAFF),
                            shape: BoxShape.circle
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.play_arrow,
                            size: 45.0,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                height: 190.0,
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: -25,
                      child: Container(
                        width: 50.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                          color:Color(0xFF0FAAFF),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0)
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right:-25,
                      child: Container(
                        width: 50.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF0FAAFF),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0)
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          song("assets/images/images.png", "Never say", "Believe 2012"),
                          song("assets/images/images.png", "BBShark", "Believe 2012"),
                          song("assets/images/images.png", "Body", "Believe 2012"),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget song(String image, String title, String subtitle){
  return Padding(
    padding:  EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          image,
          width: 40.0,
          height: 40.0,
        ),
        SizedBox(
          width: 8.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: TextStyle(color:Color(0xFF0FAAFF))),
            Text(subtitle, style: TextStyle(color:Color(0xFF0FAAFF))),
          ],
        ),
      ],
    ),
  );
}

class MClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size){
    return Rect.fromCircle(
      center: Offset(size.width/2, size.height/2),
      radius: min(size.width,size.height) / 2
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper){
    return true;
  }

}