import 'package:event_spotter/utils/data_provider.dart';
import 'package:event_spotter/widgets/app_bar.dart';
import 'package:event_spotter/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(
          "Notification",
          center: true,
          backWidget: const Icon(Icons.arrow_back, color: white).onTap(() {
            finish(context);
          }),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider();
          },
          shrinkWrap: true,
          padding: const EdgeInsets.all(12),
          itemCount: notificationList.length,
          itemBuilder: (context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                loadImage(notificationList[index].image,
                        fit: BoxFit.cover, height: 40, width: 40)
                    .cornerRadiusWithClipRRect(35),
                10.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(notificationList[index].name!,
                            style: boldTextStyle()),
                        10.width,
                        Text(notificationList[index].time!,
                            style: secondaryTextStyle()),
                      ],
                    ),
                    10.height,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(notificationList[index].subtitle!,
                                style: secondaryTextStyle(color: black)),
                            4.height,
                            Text(notificationList[index].subtime!.toUpperCase(),
                                style: secondaryTextStyle()),
                          ],
                        ).expand()
                      ],
                    )
                  ],
                ).expand()
              ],
            ).paddingSymmetric(vertical: 12);
          },
        ));
  }
}
