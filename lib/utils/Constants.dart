import 'package:nb_utils/nb_utils.dart';

const senderId = 1;
const receiverId = 2;

const appName = 'Event Spotter';
const appTagline = 'Discover  |  Connect  |  Chat';

const fashionstitle = 'Fashions Fitness AW18 \nDuring New York Fashion \nWeek';
const fashionsSubtitle =
    'Fashion can also simply mean our lifestyle: the clothing and accessories that we wear and the cosmetics that we apply.Besides clothing, ornaments, accessories, and make up, it also includes our mannerism and behavior.';
const fashionsSubtitle1 =
    'Fashion is a form of self-expression and autonomy at a particular period and place and in a specific context, of clothing, footwear, lifestyle, accessories, makeup, hairstyle, and body posture. In its everyday use, the term implies a look defined by the fashion industry as that which is trending.';

// ignore: prefer_single_quotes
const purchaseURL =
    'https://codecanyon.net/item/prokit-flutter-app-ui-design-templete-kit/25787190';

Future<void> launchUrl(String url, {bool forceWebView = false}) async {
  await launchUrl(
    url,
    forceWebView: forceWebView,
  ).catchError((e) {
    toast('Invalid URL: $url');
  });
}
