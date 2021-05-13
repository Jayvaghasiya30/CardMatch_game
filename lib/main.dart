import 'package:flutter/material.dart';
import 'screens/level1.dart';
import 'screens/level2.dart';
import 'screens/level3.dart';
import 'package:cardgame1/Data/data.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 50)),
            Text(
              "Make a Match",
              style: GoogleFonts.koHo(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 150)),
            LevelBoxes(
              hi: 50,
              wi: 250,
              title: "LEVEL 1",
              cards: 2,
              path: Level1(),
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            LevelBoxes(
              hi: 50,
              wi: 250,
              title: "LEVEL 2",
              cards: 4,
              path: Level2(),
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            LevelBoxes(
              hi: 50,
              wi: 250,
              title: "LEVEL 3",
              cards: 6,
              path: Level3(),
            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}

class LevelBoxes extends StatefulWidget {
  double hi;
  double wi;
  String title;
  int cards;
  Widget path;
  LevelBoxes({this.wi,this.hi,this.title,this.cards,this.path});
  @override
  _LevelBoxesState createState() => _LevelBoxesState();
}

class _LevelBoxesState extends State<LevelBoxes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.hi,
      width: widget.wi,
      child: TextButton(
        onPressed: () {
          setState(() {
            noOFCards =widget.cards;
            totalScore = noOFCards*100;
          });
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return widget.path;
              },
            ),
          );
        },
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: "Raleway",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white60,
          boxShadow: [ BoxShadow(
            color: Colors.black45,
            blurRadius: 20.0,
          ),]
      ),
    );
  }
}
