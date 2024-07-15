class WalkThrough {
  String? title;
  String? subtitle;
  String? image;

  WalkThrough({this.title, this.subtitle, this.image});
}

class CityModel {
  String? name;
  String? image;
  bool? selectHash;
  bool isSelected;

  CityModel(
      {this.name,
      this.image,
      this.selectHash = false,
      this.isSelected = false});
}
