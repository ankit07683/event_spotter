import 'package:event_spotter/model/EAActivityModel.dart';
import 'package:event_spotter/model/EAEventListModel.dart';
import 'package:event_spotter/model/event_modal.dart';
import 'package:event_spotter/model/EAInboxModel.dart';
import 'package:event_spotter/model/EAReviewModel.dart';
import 'package:event_spotter/model/EATicketModel.dart';
import 'package:event_spotter/model/EAWalkThroughModel.dart';
import 'package:event_spotter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'images_mapping.dart';

List<WalkThrough> walkThroughList = [
  WalkThrough(
      image: imgCityBanglore,
      title: 'EVENTS COLLECTION',
      subtitle: 'Discover the best things to do this week in this city'),
  WalkThrough(
      image: imgCityAhmedabad,
      title: 'CONNECT & FOLLOW',
      subtitle:
          'Connect with your friends, follow tastemakers and people who share your interest.'),
];

List<CityModel> cityList = [
  CityModel(name: 'ahmedabad', image: imgCityAhmedabad),
  CityModel(name: 'banglore', image: imgCityBanglore),
  CityModel(name: 'chennai', image: imgCityChennai),
  CityModel(name: 'delhi', image: imgCityDelhi),
  CityModel(name: 'hyderabad', image: imgCityHyderabad),
  CityModel(name: 'jaipur', image: imgCityJaipur),
  CityModel(name: 'kolkata', image: imgCityKolkata),
  CityModel(name: 'lucknow', image: imgCityLucknow),
  CityModel(name: 'mumbai', image: imgCityMumbai),
  CityModel(name: 'pune', image: imgCityPune),
];

List<CityModel> eventCategoriesList = [
  CityModel(name: 'music', image: eventCatMusic),
  CityModel(name: 'festival', image: eventCatFestival),
  CityModel(name: 'food', image: eventCatFood),
  CityModel(name: 'cinema', image: eventCatCinema),
  CityModel(name: 'technology', image: eventCatTechnology),
  CityModel(name: 'exhibition', image: eventCatExhibition),
];

List<CityModel> filterDateList = [
  CityModel(name: 'All Dates'),
  CityModel(name: 'Today'),
  CityModel(name: 'Tomorrow'),
  CityModel(name: 'This week'),
];

List<CityModel> filterHashtagList = [
  CityModel(name: 'All Hashtags', isSelected: false),
  CityModel(name: 'music', isSelected: false),
  CityModel(name: 'festival', isSelected: false),
  CityModel(name: 'food', isSelected: false),
  CityModel(name: 'cinema', isSelected: false),
  CityModel(name: 'music', isSelected: false),
  CityModel(name: 'festival', isSelected: false),
];

// Dummy data for events
List<EventItem> forYouList = [
  // Events in Ahmedabad
  EventItem(
    name: 'Gujarat Music Fest',
    add: 'ABC Street, Ahmedabad',
    attending: '500/1k attending',
    category: 'music',
    rating: 4.5,
    price: '30',
    distance: 5,
    city: "ahmedabad",
    image: imgCityAhmedabad,
    fev: true,
  ),
  EventItem(
    name: 'Ahmedabad Food Festival',
    add: 'XYZ Ground, Ahmedabad',
    attending: '300/800 attending',
    category: 'food',
    rating: 4.2,
    price: '25',
    distance: 3,
    city: "ahmedabad",
    image: imgCityAhmedabad,
    fev: false,
  ),

  // Events in Bangalore
  EventItem(
    name: 'Bangalore Tech Summit',
    add: 'Convention Center, Bangalore',
    attending: '1000/2k attending',
    category: 'technology',
    rating: 4.8,
    price: '50',
    distance: 10,
    city: "bangalore",
    image: imgCityBanglore,
    fev: true,
  ),
  EventItem(
    name: 'Cultural Extravaganza',
    add: 'Banerghatta Road, Bangalore',
    attending: '700/1.5k attending',
    category: 'festival',
    rating: 4.4,
    price: '40',
    distance: 8,
    city: "bangalore",
    image: imgCityBanglore,
    fev: false,
  ),
  // Add more events for Bangalore here...

  // Events in Chennai
  EventItem(
    name: 'Chennai Music Carnival',
    add: 'Marina Beach, Chennai',
    attending: '400/900 attending',
    category: 'music',
    rating: 4.0,
    price: '35',
    distance: 4,
    city: "chennai",
    image: imgCityChennai,
    fev: true,
  ),
  EventItem(
    name: 'Film Fest Chennai',
    add: 'T Nagar, Chennai',
    attending: '200/600 attending',
    category: 'cinema',
    rating: 4.1,
    price: '20',
    distance: 2,
    city: "chennai",
    image: imgCityChennai,
    fev: false,
  ),
  // Add more events for Chennai here...

  // Events in Delhi
  EventItem(
    name: 'Delhi Food Truck Festival',
    add: 'Jawaharlal Nehru Stadium, Delhi',
    attending: '1200/3k attending',
    category: 'food',
    rating: 4.7,
    price: '45',
    distance: 15,
    city: "delhi",
    image: imgCityDelhi,
    fev: true,
  ),
  EventItem(
    name: 'Art and Craft Exhibition',
    add: 'Connaught Place, Delhi',
    attending: '600/1.2k attending',
    category: 'exhibition',
    rating: 4.3,
    price: '30',
    distance: 10,
    city: "delhi",
    image: imgCityDelhi,
    fev: false,
  ),
  // Add more events for Delhi here...

  // Events in Hyderabad
  EventItem(
    name: 'Hyderabad Dance Fest',
    add: 'HITEC City, Hyderabad',
    attending: '800/1.5k attending',
    category: 'festival',
    rating: 4.6,
    price: '40',
    distance: 12,
    city: "hyderabad",
    image: imgCityHyderabad,
    fev: true,
  ),
  EventItem(
    name: 'Hyderabad Tech Expo',
    add: 'Gachibowli Stadium, Hyderabad',
    attending: '900/2k attending',
    category: 'technology',
    rating: 4.9,
    price: '55',
    distance: 8,
    city: "hyderabad",
    image: imgCityHyderabad,
    fev: false,
  ),
  // Add more events for Hyderabad here...

  // Events in Jaipur
  EventItem(
    name: 'Jaipur Literature Festival',
    add: 'Diggi Palace, Jaipur',
    attending: '300/700 attending',
    category: 'festival',
    rating: 4.4,
    price: '35',
    distance: 5,
    city: "jaipur",
    image: imgCityJaipur,
    fev: true,
  ),
  EventItem(
    name: 'Rajasthan Food Fair',
    add: 'Amber Fort, Jaipur',
    attending: '400/1k attending',
    category: 'food',
    rating: 4.2,
    price: '30',
    distance: 7,
    city: "jaipur",
    image: imgCityJaipur,
    fev: false,
  ),
  // Add more events for Jaipur here...

  // Events in Kolkata
  EventItem(
    name: 'Kolkata Music Marathon',
    add: 'Maidan, Kolkata',
    attending: '600/1.2k attending',
    category: 'music',
    rating: 4.3,
    price: '25',
    distance: 3,
    city: "kolkata",
    image: imgCityKolkata,
    fev: true,
  ),
  EventItem(
    name: 'Art Film Festival',
    add: 'Park Street, Kolkata',
    attending: '500/900 attending',
    category: 'cinema',
    rating: 4.0,
    price: '20',
    distance: 4,
    city: "kolkata",
    image: imgCityKolkata,
    fev: false,
  ),
  // Add more events for Kolkata here...

  // Events in Lucknow
  EventItem(
    name: 'Lucknow Kebab Festival',
    add: 'Hazratganj, Lucknow',
    attending: '400/800 attending',
    category: 'food',
    rating: 4.6,
    price: '35',
    distance: 5,
    city: "lucknow",
    image: imgCityLucknow,
    fev: true,
  ),
  EventItem(
    name: 'Cultural Heritage Expo',
    add: 'Bara Imambara, Lucknow',
    attending: '300/600 attending',
    category: 'exhibition',
    rating: 4.3,
    price: '30',
    distance: 3,
    city: "lucknow",
    image: imgCityLucknow,
    fev: false,
  ),
  // Add more events for Lucknow here...

  // Events in Mumbai
  EventItem(
    name: 'Mumbai Film Festival',
    add: 'Juhu Beach, Mumbai',
    attending: '1500/3k attending',
    category: 'cinema',
    rating: 4.8,
    price: '50',
    distance: 10,
    city: "mumbai",
    image: imgCityMumbai,
    fev: true,
  ),
  EventItem(
    name: 'Music Mania Mumbai',
    add: 'Gateway of India, Mumbai',
    attending: '1200/2k attending',
    category: 'music',
    rating: 4.7,
    price: '45',
    distance: 8,
    city: "mumbai",
    image: imgCityMumbai,
    fev: false,
  ),
  // Add more events for Mumbai here...

  // Events in Pune
  EventItem(
    name: 'Pune Food Fest',
    add: 'Magarpatta City, Pune',
    attending: '700/1.5k attending',
    category: 'food',
    rating: 4.5,
    price: '40',
    distance: 6,
    city: "pune",
    image: imgCityPune,
    fev: true,
  ),
  EventItem(
    name: 'Tech Expo Pune',
    add: 'Aga Khan Palace, Pune',
    attending: '500/1k attending',
    category: 'technology',
    rating: 4.3,
    price: '35',
    distance: 4,
    city: "pune",
    image: imgCityPune,
    fev: false,
  ),
  // Add more events for Pune here...
];

// You can add more events similarly for each city and category as needed.

List<EventItem> getMayKnowData() {
  List<EventItem> list = [];
  list.add(EventItem(
      name: 'jose Lowe',
      add: '156 followers',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg',
      fev: false));
  list.add(EventItem(
      name: 'Smit Jhon',
      add: '200 followers',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg',
      fev: false));
  list.add(EventItem(
      name: 'Louisa Lyons',
      add: '230 followers',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.2.jpg',
      fev: false));
  list.add(EventItem(
      name: 'Hulda James',
      add: '100 followers',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.3.jpg',
      fev: false));
  list.add(EventItem(
      name: 'Bessie Mendoza',
      add: '150 followers',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.4.jpg',
      fev: false));
  list.add(EventItem(
      name: 'Matilda MCGuire',
      add: '260 followers',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg',
      fev: false));
  list.add(EventItem(
      name: 'Harriett Coleman',
      add: '400 followers',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg',
      fev: false));
  return list;
}

List<EAMessageModel> getChatMsgData() {
  List<EAMessageModel> list = [];

  EAMessageModel c1 = EAMessageModel();
  c1.senderId = senderId;
  c1.receiverId = receiverId;
  c1.msg = 'Helloo';
  c1.time = '1:43 AM';
  list.add(c1);

  EAMessageModel c2 = EAMessageModel();
  c2.senderId = senderId;
  c2.receiverId = receiverId;
  c2.msg = 'How are you? What are you doing?';
  c2.time = '1:45 AM';
  list.add(c2);

  EAMessageModel c3 = EAMessageModel();
  c3.senderId = receiverId;
  c3.receiverId = senderId;
  c3.msg = 'Helloo...';
  c3.time = '1:45 AM';
  list.add(c3);

  EAMessageModel c4 = EAMessageModel();
  c4.senderId = senderId;
  c4.receiverId = receiverId;
  c4.msg = 'I am good. Can you do something for me? I need your help.';
  c4.time = '1:45 AM';
  list.add(c4);

  EAMessageModel c5 = EAMessageModel();
  c5.senderId = senderId;
  c5.receiverId = receiverId;
  c5.msg = 'I am good. Can you do something for me? I need your help.';
  c5.time = '1:45 AM';
  list.add(c5);

  EAMessageModel c6 = EAMessageModel();
  c6.senderId = receiverId;
  c6.receiverId = senderId;
  c6.msg = 'I am good. Can you do something for me? I need your help.';
  c6.time = '1:45 AM';
  list.add(c6);

  EAMessageModel c7 = EAMessageModel();
  c7.senderId = senderId;
  c7.receiverId = receiverId;
  c7.msg = 'I am good. Can you do something for me? I need your help.';
  c7.time = '1:45 AM';
  list.add(c7);

  EAMessageModel c8 = EAMessageModel();
  c8.senderId = receiverId;
  c8.receiverId = senderId;
  c8.msg = 'I am good. Can you do something for me? I need your help.';
  c8.time = '1:45 AM';
  list.add(c8);

  EAMessageModel c9 = EAMessageModel();
  c9.senderId = senderId;
  c9.receiverId = receiverId;
  c9.msg = 'I am good. Can you do something for me? I need your help.';
  c9.time = '1:45 AM';
  list.add(c9);

  EAMessageModel c10 = EAMessageModel();
  c10.senderId = receiverId;
  c10.receiverId = senderId;
  c10.msg = 'I am good. Can you do something for me? I need your help.';
  c10.time = '1:45 AM';
  list.add(c10);

  EAMessageModel c11 = EAMessageModel();
  c11.senderId = receiverId;
  c11.receiverId = senderId;
  c11.msg = 'I am good. Can you do something for me? I need your help.';
  c11.time = '1:45 AM';
  list.add(c11);

  EAMessageModel c12 = EAMessageModel();
  c12.senderId = senderId;
  c12.receiverId = receiverId;
  c12.msg = 'I am good. Can you do something for me? I need your help.';
  c12.time = '1:45 AM';
  list.add(c12);

  EAMessageModel c13 = EAMessageModel();
  c13.senderId = senderId;
  c13.receiverId = receiverId;
  c13.msg = 'I am good. Can you do something for me? I need your help.';
  c13.time = '1:45 AM';
  list.add(c13);

  EAMessageModel c14 = EAMessageModel();
  c14.senderId = receiverId;
  c14.receiverId = senderId;
  c14.msg = 'I am good. Can you do something for me? I need your help.';
  c14.time = '1:45 AM';
  list.add(c14);

  EAMessageModel c15 = EAMessageModel();
  c15.senderId = senderId;
  c15.receiverId = receiverId;
  c15.msg = 'I am good. Can you do something for me? I need your help.';
  c15.time = '1:45 AM';
  list.add(c15);

  EAMessageModel c16 = EAMessageModel();
  c16.senderId = receiverId;
  c16.receiverId = senderId;
  c16.msg = 'I am good. Can you do something for me? I need your help.';
  c16.time = '1:45 AM';
  list.add(c16);

  EAMessageModel c17 = EAMessageModel();
  c17.senderId = senderId;
  c17.receiverId = receiverId;
  c17.msg = 'I am good. Can you do something for me? I need your help.';
  c17.time = '1:45 AM';
  list.add(c17);

  EAMessageModel c18 = EAMessageModel();
  c18.senderId = receiverId;
  c18.receiverId = senderId;
  c18.msg = 'I am good. Can you do something for me? I need your help.';
  c18.time = '1:45 AM';
  list.add(c18);

  return list;
}

List<EAEventList> eventList = [
  EAEventList(
      name: 'Fashion finest AW17 During London Fashion Week',
      date: 'MAR 30,2016',
      image: cityParis),
  EAEventList(
      name: 'Bike New York For Bike Month',
      date: 'MAR 24,2018',
      image: cityTokyo),
  EAEventList(
      name: 'Washington Square Outdoor Art Exhibit',
      date: 'MAR 20,2018',
      image: cityNewYork),
  EAEventList(
      name: 'Why Las vegas hotal Room For you',
      date: 'MAR 15,2018',
      image: eventCatFestival),
  EAEventList(
      name: 'Bike New York For Bike Month',
      date: 'MAR 24,2018',
      image: eventCatMusic),
  EAEventList(
      name: 'Washington Square Outdoor Art Exhibit',
      date: 'MAR 20,2018',
      image: cityLondon),
  EAEventList(
      name: 'Why Las vegas hotal Room For you',
      date: 'MAR 15,2018',
      image: cityTokyo),
];

List<EAReviewModel> reviewList() {
  List<EAReviewModel> list = [];
  list.add(EAReviewModel(
      name: 'jose Lowe',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg',
      fev: false,
      time: '3 Hours ago',
      rating: 4.3,
      like: 12,
      msg: 'Good'));
  list.add(EAReviewModel(
      name: 'Smit Jhon',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg',
      fev: false,
      time: '4 Hours ago',
      rating: 1,
      like: 1,
      msg: 'Awesome images...'));
  list.add(EAReviewModel(
      name: 'Louisa Lyons',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.2.jpg',
      fev: false,
      time: '6 Hours ago',
      rating: 3.4,
      like: 6,
      msg: 'great event'));
  list.add(EAReviewModel(
      name: 'Hulda James',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.3.jpg',
      fev: false,
      time: '8 Hours ago',
      rating: 4,
      like: 2,
      msg: 'very nice'));
  list.add(EAReviewModel(
      name: 'Bessie Mendoza',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.4.jpg',
      fev: false,
      time: '8 Hours ago',
      rating: 3,
      like: 1));
  list.add(EAReviewModel(
      name: 'Matilda MCGuire',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg',
      fev: false,
      time: '9 Hours ago',
      rating: 2,
      like: 3));
  list.add(EAReviewModel(
      name: 'Harriett Coleman',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg',
      fev: false,
      time: '12 Hours ago',
      rating: 3,
      like: 1,
      msg: 'i will join it now'));
  return list;
}

List<EATicketModel> ticketList = [
  EATicketModel(
      name: 'Normal Ticket',
      time: '4:30 until 6:30',
      payment: 'Sold Out',
      count: 0),
  EATicketModel(
      name: 'VIP Ticket',
      time: '6:30 until 7:30',
      payment: '*\$80=\$0',
      count: 0),
  EATicketModel(
      name: 'Normal Ticket',
      time: '4:30 until 6:30',
      payment: '*\$80=\$0',
      count: 0),
  EATicketModel(
      name: 'VIP Ticket',
      time: '6:30 until 7:30',
      payment: '*\$80=\$160',
      count: 2),
];

List<EAInboxModel> inboxList = [
  EAInboxModel(
      msg: 'Fashion finest AW17 During London Fashion Week',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg',
      name: 'jose Lowe'),
  EAInboxModel(
      msg: 'Bike New York For Bike Month',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg',
      name: 'Smit Jhon'),
  EAInboxModel(
      msg: 'Washington Square Outdoor Art Exhibit',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.2.jpg',
      name: 'Louisa Lyons'),
  EAInboxModel(
      msg: 'Why Las vegas hotal Room For you',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.3.jpg',
      name: 'Hulda James'),
  EAInboxModel(
      msg: 'Bike New York For Bike Month',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.4.jpg',
      name: 'Bessie Mendoza'),
  EAInboxModel(
      msg: 'Washington Square Outdoor Art Exhibit',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg',
      name: 'Matilda MCGuire'),
  EAInboxModel(
      msg: 'Why Las vegas hotal Room For you',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg',
      name: 'Harriett Coleman'),
  EAInboxModel(
      msg: 'Fashion finest AW17 During London Fashion Week',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg',
      name: 'jose Lowe'),
  EAInboxModel(
      msg: 'Bike New York For Bike Month',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg',
      name: 'Smit Jhon'),
  EAInboxModel(
      msg: 'Washington Square Outdoor Art Exhibit',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.2.jpg',
      name: 'Louisa Lyons'),
  EAInboxModel(
      msg: 'Why Las vegas hotal Room For you',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.3.jpg',
      name: 'Hulda James'),
  EAInboxModel(
      msg: 'Bike New York For Bike Month',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.4.jpg',
      name: 'Bessie Mendoza'),
  EAInboxModel(
      msg: 'Washington Square Outdoor Art Exhibit',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg',
      name: 'Matilda MCGuire'),
  EAInboxModel(
      msg: 'Why Las vegas hotal Room For you',
      image:
          'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg',
      name: 'Harriett Coleman'),
];

List<EAActivityModel> activityList = [
  EAActivityModel(
      name: 'Bottled Art wine painting night',
      image: eventCatMusic,
      icon: Icons.login_outlined,
      subtitle: 'joined the list',
      time: '10 min ago',
      subtime: 'sun mar,25 - 4.30 pm est'),
  EAActivityModel(
      name: 'win 2 tickets to WWE @MSC',
      image: eventCatFestival,
      icon: Icons.shopping_cart_outlined,
      subtitle: 'Brought ticket',
      time: '10 min ago',
      subtime: 'sun mar,25 - 4.30 pm est'),
  EAActivityModel(
      name: 'Bottled Art wine painting night',
      image: eventCatCinema,
      icon: Icons.login_outlined,
      subtitle: 'joined the list',
      time: '10 min ago',
      subtime: 'sun mar,25 - 4.30 pm est'),
  EAActivityModel(
      name: 'Emc Black ticket',
      image: cityTokyo,
      icon: Icons.login_outlined,
      subtitle: 'joined the list',
      time: '10 min ago',
      subtime: 'sun mar,25 - 4.30 pm est'),
  EAActivityModel(
      name: 'win 2 tickets to WWE @MSC',
      image: cityParis,
      icon: Icons.login_outlined,
      subtitle: 'joined the list',
      time: '10 min ago',
      subtime: 'sun mar,25 - 4.30 pm est'),
  EAActivityModel(
      name: 'Bottled Art wine painting night',
      image: eventCatMusic,
      icon: Icons.login_outlined,
      subtitle: 'joined the list',
      time: '10 min ago',
      subtime: 'sun mar,25 - 4.30 pm est'),
];

List<EAActivityModel> notificationList = [
  EAActivityModel(
      name: 'Sandra minalo',
      image: eventCatMusic,
      time: 'send you message',
      subtime: 'sun mar,25 - 4.30 pm est',
      subtitle: 'joined the list'),
  EAActivityModel(
      name: 'innie Lyons',
      image: eventCatFestival,
      time: 'send you message',
      subtime: 'sun mar,25 - 4.30 pm est',
      subtitle: 'joined the list'),
  EAActivityModel(
      name: 'Sandra minalo',
      image: eventCatCinema,
      time: 'send you message',
      subtime: 'sun mar,25 - 4.30 pm est',
      subtitle: ' Brought ticket'),
  EAActivityModel(
      name: 'Linnie Lyons',
      image: cityTokyo,
      time: 'send you message',
      subtime: 'sun mar,25 - 4.30 pm est',
      subtitle: 'joined the list'),
  EAActivityModel(
      name: 'Sandra minalo',
      image: cityParis,
      time: 'send you message',
      subtime: 'sun mar,25 - 4.30 pm est',
      subtitle: ' Brought ticket'),
  EAActivityModel(
      name: 'Linnie Lyons',
      image: eventCatMusic,
      time: 'send you message',
      subtime: 'sun mar,25 - 4.30 pm est',
      subtitle: 'oined the list'),
];

List<EAActivityModel> imageList = [
  EAActivityModel(image: cityNewYork),
  EAActivityModel(image: cityParis),
  EAActivityModel(image: cityTokyo),
];
