import 'package:cardgame1/Data/data.dart';
import 'package:cardgame1/model/tile_model.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cardgame1/main.dart';
import 'package:cardgame1/model/functionality.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Level1 extends StatefulWidget {
  @override
  _Level1State createState() => _Level1State();
}

class _Level1State extends State<Level1> {
  @override
  void initState() {
    super.initState();
   setState(() {
     restart();
   });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 30)),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(left: 30)),
                IconButton(
                    icon: FaIcon(FontAwesomeIcons.home),
                    onPressed: () {
                      Navigator.pop(context);
                    }

                ),
                Padding(padding: EdgeInsets.only(left: 100)),
                IconButton(
                    icon: FaIcon(FontAwesomeIcons.sync),
                    onPressed: () {
                      setState(() {
                        restart();
                      });
                    }

                ),

                Padding(padding: EdgeInsets.only(left: 80)),
                Column(
                  children: [
                    Text(
                      "$points/$totalScore",
                      style: GoogleFonts.koHo(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Text(
                      "Points",
                      style: GoogleFonts.koHo(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),


              ],
            ),
            GridView.count(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              children: [
                ...visiblepairs.map((i) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Tile(
                          imageAssetPath: i.getImageAssetPath(),
                          selected: i.getIsSelected(),
                          j: i,
                          parent: this,
                          i: visiblepairs.indexOf(i),
                          hi: 160,
                          wi: 100,

                        )
                      ],
                    )),
              ],

            ),

          ],
        ),
      ),
    );
  }
}



