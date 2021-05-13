import 'package:flutter/material.dart';
import '../model/tile_model.dart';

int points =0;
bool selected = false;
String slectedimahepath = "";
int previousSelectedId;

int noOFCards;
int totalScore = noOFCards*100;

var levelstate;

List<TileModel>pairs1 = [];
List<TileModel>pairs = [];
List<TileModel>visiblepairs = [];
List<TileModel> getPairs(){
  List<TileModel> pairs = [];
  TileModel tileModel = TileModel();


  for(int i=1;i<53;i++){
    tileModel.setImageAssetPath("assets/"+i.toString()+".png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
  //  pairs.add(tileModel);
    tileModel = TileModel();
  }
  return pairs;
}

List<TileModel>getQuestions(){
  List<TileModel> pairs = [];
  TileModel tileModel = TileModel();


  for(int i=0;i<2*noOFCards;i++){
    tileModel.setImageAssetPath("assets/gray_back.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
   // pairs.add(tileModel);
    tileModel = TileModel();
  }
  return pairs;
}