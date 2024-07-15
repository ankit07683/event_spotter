import 'package:event_spotter/components/profile_header.dart';
import 'package:event_spotter/service/routing_service.dart';
import 'package:event_spotter/utils/colors.dart';
import 'package:event_spotter/utils/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  bool pinned = true;

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
              expandedHeight: context.height() * 0.50,
              floating: false,
              pinned: true,
              centerTitle: true,
              title: Text(innerBoxIsScrolled ? 'Smit john' : "",
                  style: boldTextStyle(color: white)),
              backgroundColor:
                  innerBoxIsScrolled ? primaryColor1 : transparentColor,
              forceElevated: innerBoxIsScrolled,
              iconTheme: const IconThemeData(color: white),
              automaticallyImplyLeading: false,
              flexibleSpace: const FlexibleSpaceBar(
                background: ProfileHeaderComponent(),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                          onPressed: () => context.go(notificationsScreen),
                          icon: const Icon(Icons.notifications_active_outlined,
                              color: white, size: 28),
                        ),
                        Positioned(
                          right: 4,
                          top: 6,
                          child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: white),
                              child: Text('1',
                                  style: secondaryTextStyle(
                                      color: primaryColor1))),
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          // TODO: add setting screenn
                        },
                        icon: const Icon(Icons.settings, color: white))
                  ],
                )
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              16.height,
              Text('Activity'.toUpperCase(),
                  style: boldTextStyle(color: primaryColor1)),
              const Divider(color: primaryColor1),
              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(12),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: activityList.length,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(activityList[index].icon!),
                      10.width,
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(activityList[index].subtitle!,
                                  style: secondaryTextStyle(color: black)),
                              10.width,
                              Text(activityList[index].time!.toUpperCase(),
                                  style: secondaryTextStyle()),
                            ],
                          ),
                          10.height,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(activityList[index].image!,
                                      height: 80, width: 100, fit: BoxFit.cover)
                                  .cornerRadiusWithClipRRect(8),
                              12.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(activityList[index].name!,
                                      style: boldTextStyle()),
                                  4.height,
                                  Text(
                                      activityList[index]
                                          .subtime!
                                          .toUpperCase(),
                                      style: secondaryTextStyle()),
                                ],
                              ).expand(),
                            ],
                          )
                        ],
                      ).expand()
                    ],
                  ).paddingSymmetric(vertical: 8);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
