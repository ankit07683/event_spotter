class UserData {
  String? city;
  String? email;
  String? image;
  List<String>? intrests;
  String? username;
  String? name;
  UserData({this.city, this.email, this.image, this.intrests, this.username});
}

class UserState extends UserData {
  bool? loading;
  UserData? userData;
  UserState({this.loading, this.userData});
}
