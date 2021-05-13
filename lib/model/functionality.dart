import 'package:cardgame1/Data/data.dart';
import 'package:cardgame1/model/tile_model.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cardgame1/main.dart';
import 'package:google_fonts/google_fonts.dart';


class Tile extends StatefulWidget {
  String imageAssetPath;
  bool selected;
  State parent;
  int i;
  TileModel j;
  double wi;
  double hi;
  Tile({this.imageAssetPath, this.selected, this.parent, this.i, this.j,this.wi,this.hi});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    showAlertDialog(BuildContext context) {

      // set up the buttons

      // Widget continueButton = TextButton(
      //   child: Text(
      //     "Replay",
      //     style: GoogleFonts.koHo(
      //       color: Colors.green,
      //       fontSize: 25,
      //       fontWeight: FontWeight.w500,
      //     ),
      //   ),
      //   onPressed:  () {
      //     setState(() {
      //       restart();
      //     });
      //     Navigator.pop(context);
      //   },
      // );
      Widget Restart = TextButton(
        child: Text(
          "Restart",
          style: GoogleFonts.koHo(
            color: Colors.green,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed:  () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return MyHomePage();
              },
            ),
          );
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title:  Text(
          "Game Over!!",
          style: GoogleFonts.koHo(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),

        content:  Text(
          "Yeah!! All Cards are Matched..",
          style: GoogleFonts.koHo(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),

        actions: [
          Restart,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Container(
      child: GestureDetector(
        onTap: () {
          print(pairs[widget.i].getIsSelected());
          if (true) {
            setState(() {
              print(widget.i);
              pairs[widget.i].isSelected = true;
            });
            if (slectedimahepath != "") {
              if (slectedimahepath == pairs[widget.i].getImageAssetPath() &&
                  widget.i != previousSelectedId) {
                print("correct");


                Future.delayed(const Duration(seconds: 1), () {

                  points = points + 100;
                  print(widget.i);
                  print(previousSelectedId);

                  visiblepairs[widget.i]
                      .setImageAssetPath("assets/blue_back.png");
                  visiblepairs[previousSelectedId]
                      .setImageAssetPath("assets/blue_back.png");

                  pairs[widget.i].isSelected = false;
                  pairs[previousSelectedId].isSelected = false;
                  setState(() {});
                  widget.parent.setState(() {});
                  if(points == noOFCards*100){
                    showAlertDialog(context);
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return MyHomePage();
                    //     },
                    //   ),
                    // );
                  }
                });

              } else {
                print("incorrect");
                Future.delayed(const Duration(seconds: 1), () {

                  // visiblepairs[widget.i]
                  //     .setImageAssetPath("assets/gray_back.png");
                  // visiblepairs[previousSelectedId]
                  //     .setImageAssetPath("assets/gray_back.png");

                  pairs[widget.i].isSelected = false;
                  pairs[previousSelectedId].isSelected = false;
                  setState(() {});
                  widget.parent.setState(() {});


                });
              }
              slectedimahepath = "";
            } else {
              slectedimahepath = pairs[widget.i].getImageAssetPath();
              previousSelectedId = widget.i;
            }
          }
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 120,top: 60),
          height: widget.hi,
          width: widget.wi,
          //padding: EdgeInsets.only(top: 40,bottom: 30),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(pairs[widget.i].getIsSelected()
                    ? pairs[widget.i].getImageAssetPath()
                    : widget.j.getImageAssetPath()),
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}



void restart(){
  pairs = [];
  visiblepairs = [];
  points=0;
  pairs1 = getPairs();
  print(pairs1.length);
  for (int i = 0; i < noOFCards; i++) {
    final _random = Random();
    var element = pairs1[_random.nextInt(pairs1.length)];
    pairs.add(element);
    pairs1.remove(element);
  }
  List<TileModel> temp = List.from(pairs);
  pairs = pairs + temp;
  pairs.shuffle();
  print(pairs);
  visiblepairs = getQuestions();

}




