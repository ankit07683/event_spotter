import 'package:event_spotter/utils/colors.dart';
import 'package:event_spotter/utils/constants.dart';
import 'package:event_spotter/utils/data_provider.dart';
import 'package:event_spotter/utils/images_mapping.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key});

  @override
  State<NewsDetailScreen> createState() => NewsDetailScreenState();
}

class NewsDetailScreenState extends State<NewsDetailScreen> {
  bool? like = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              expandedHeight: 250.0,
              pinned: true,
              backgroundColor:
                  innerBoxIsScrolled ? primaryColor1 : transparentColor,
              forceElevated: innerBoxIsScrolled,
              iconTheme: const IconThemeData(color: white),
              automaticallyImplyLeading: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(cityParis,
                        fit: BoxFit.cover, width: context.width()),
                  ],
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share, color: white))
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(fashionstitle, style: boldTextStyle(size: 24)),
              8.height,
              Text("MAR 10,2021", style: secondaryTextStyle()),
              16.height,
              Text(fashionsSubtitle, style: primaryTextStyle()),
              16.height,
              Text(fashionsSubtitle1, style: primaryTextStyle()),
              16.height,
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(cityTokyo,
                          height: 230,
                          width: context.width(),
                          fit: BoxFit.cover)
                      .cornerRadiusWithClipRRect(8),
                  Positioned(
                    right: 16,
                    top: 16,
                    child: Icon(like! ? Icons.favorite : Icons.favorite_border,
                            color: like! ? redColor : white, size: 22)
                        .onTap(() {
                      like = !like!;
                      setState(() {});
                    }),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    decoration: boxDecorationWithRoundedCorners(
                        backgroundColor: primaryColor1,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        )),
                    child: Row(
                      children: [
                        const Icon(Icons.timer_sharp, color: white),
                        10.width,
                        Text("06 Hrs 27 Mins 44 Secs,",
                            style: primaryTextStyle(color: white)),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  4.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("#cinema #movie", style: secondaryTextStyle()),
                      Text('\$' '20',
                          style: boldTextStyle(color: primaryColor1)),
                    ],
                  ),
                  4.height,
                  Text("NY Single Party Events", style: boldTextStyle()),
                  4.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingBarWidget(
                        onRatingChanged: (rating) {},
                        rating: 4.3,
                        allowHalfRating: true,
                        itemCount: 5,
                        size: 16,
                        activeColor: primaryColor1,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        defaultIconData: Icons.star_border_outlined,
                      ),
                      8.width,
                      Text('1.3k', style: secondaryTextStyle()),
                    ],
                  ),
                  6.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_on, size: 16),
                          8.width,
                          Text("93, Bayport Ave South..",
                              style: secondaryTextStyle()),
                        ],
                      ),
                      Text('8' 'km',
                          style: secondaryTextStyle(color: primaryColor1)),
                    ],
                  ),
                  6.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.local_activity_outlined, size: 16),
                      8.width,
                      Text("19/5k attending", style: secondaryTextStyle()),
                    ],
                  ),
                ],
              ),
              16.height,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 8),
                itemCount: eventList.length,
                itemBuilder: (context, i) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        eventList[i].image!,
                        fit: BoxFit.cover,
                        width: 150,
                        height: 100,
                      ).cornerRadiusWithClipRRect(8),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(eventList[i].name!, style: boldTextStyle()),
                          16.height,
                          Text(eventList[i].date!, style: secondaryTextStyle()),
                        ],
                      ).expand()
                    ],
                  ).paddingSymmetric(vertical: 8);
                },
              )
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
