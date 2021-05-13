class TileModel{
  String imageAssetPath;
  bool isSelected;

  TileModel({this.imageAssetPath,this.isSelected});


  void setImageAssetPath(String getImagepath){
    imageAssetPath = getImagepath;
  }
  void setIsSelected(bool getIsSelected){
    isSelected = getIsSelected;
  }
  String getImageAssetPath(){
    return imageAssetPath;
  }
  bool getIsSelected(){
    return isSelected;
  }
}

