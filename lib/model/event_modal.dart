class EventItem {
  String? category;
  String? name;
  double? rating;
  String? add;
  String? attending;
  String? time;
  String? image;
  String? city;
  String? price;
  double? distance;
  bool? fev;

  EventItem(
      {this.category,
      this.name,
      this.rating,
      this.add,
      this.attending,
      this.time,
      this.image,
      this.city,
      this.distance,
      this.price,
      this.fev = false});
}

class EAMessageModel {
  int? senderId;
  int? receiverId;
  String? msg;
  String? time;

  EAMessageModel({this.senderId, this.receiverId, this.msg, this.time});
}
