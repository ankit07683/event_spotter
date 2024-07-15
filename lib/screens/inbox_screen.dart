import 'package:event_spotter/service/routing_service.dart';
import 'package:event_spotter/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:event_spotter/model/EAInboxModel.dart';
import 'package:event_spotter/utils/data_provider.dart';
import 'package:event_spotter/widgets/app_bar.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({
    super.key,
  });

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        "Inbox",
        center: true,
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        padding: EdgeInsets.all(8),
        shrinkWrap: true,
        itemCount: inboxList.length,
        itemBuilder: (BuildContext context, int index) {
          EAInboxModel data = inboxList[index];
          return Container(
            margin: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                loadImage(
                  data.image,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                ).cornerRadiusWithClipRRect(35),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.name!, style: boldTextStyle()),
                    4.height,
                    Text(data.msg!, style: secondaryTextStyle()),
                  ],
                ).expand(),
              ],
            ),
          ).onTap(() => context.go('$chatScreen/123'));
        },
      ),
    );
  }
}
