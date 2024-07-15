import 'package:event_spotter/providers/user.dart';
import 'package:event_spotter/service/routing_service.dart';
import 'package:event_spotter/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:event_spotter/utils/colors.dart';
import 'package:event_spotter/utils/images_mapping.dart';

class ProfileHeaderComponent extends ConsumerStatefulWidget {
  const ProfileHeaderComponent({super.key});

  @override
  ConsumerState<ProfileHeaderComponent> createState() =>
      _ProfileHeaderComponentState();
}

class _ProfileHeaderComponentState
    extends ConsumerState<ProfileHeaderComponent> {
  String intrestedIn = '';
  @override
  Widget build(
    BuildContext context,
  ) {
    final userState = ref.watch(userProvider);
    final userData = userState.userData;
    if (userData != null && userData.intrests != null) {
      intrestedIn = userData.intrests!.join(", ");
    }

    return Stack(
      children: [
        loadImage(imgUserProfileBg,
            fit: BoxFit.cover, width: context.width(), height: 300),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16, left: 16, top: 200),
              padding: const EdgeInsets.only(left: 16, right: 16),
              width: context.width(),
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                boxShadow: defaultBoxShadow(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  16.height,
                  Text(userData!.username!, style: boldTextStyle()),
                  4.height,
                  Text(userData.city!, style: primaryTextStyle()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 12),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            decoration: boxDecorationWithRoundedCorners(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(color: primaryColor1)),
                            child: Text('INBOX',
                                style: primaryTextStyle(color: primaryColor1)),
                          ).onTap(
                              () => context.go(dashboardScreen + inboxScreen)),
                          Positioned(
                            right: 5,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: primaryColor1),
                              child: Text('1',
                                  style: secondaryTextStyle(color: white)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  16.height,
                  Divider(
                      color: primaryColor1.withOpacity(0.3),
                      height: 0.1,
                      thickness: 0.2),
                  16.height,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: '1.5M ', style: boldTextStyle()),
                                TextSpan(
                                    text: 'followers',
                                    style: secondaryTextStyle()),
                              ],
                            ),
                          ),
                          24.width,
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: '25 ', style: boldTextStyle()),
                                TextSpan(
                                    text: 'following',
                                    style: secondaryTextStyle()),
                              ],
                            ),
                          ),
                        ],
                      ),
                      8.height,
                      Text('Interested in:', style: secondaryTextStyle()),
                      8.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            intrestedIn.toUpperCase(),
                            style: boldTextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ).expand(),
                ],
              ).paddingTop(16),
            ),
            Positioned(
              top: 130,
              child: loadImage(userData.image,
                      height: 100, width: 100, fit: BoxFit.cover)
                  .cornerRadiusWithClipRRect(50),
            )
          ],
        ),
      ],
    );
  }
}
