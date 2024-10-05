import 'package:event_spotter/model/event_modal.dart';
import 'package:event_spotter/providers/user.dart';
import 'package:event_spotter/service/routing_service.dart';
import 'package:event_spotter/utils/colors.dart';
import 'package:event_spotter/utils/data_provider.dart';
import 'package:event_spotter/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, this.name});
  final String? name;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userProvider);
    final String userCity = userState.userData!.city!;
    final List<EventItem> filteredEvents =
        forYouList.where((event) => event.city == userCity).toList();
    return Scaffold(
      appBar: getAppBar("Plan in $userCity"),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(bottom: 40),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredEvents.length,
                  itemBuilder: (context, i) {
                    EventItem event = filteredEvents[i];
                    return Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Image.asset(event.image!,
                                height: 230,
                                width: context.width(),
                                fit: BoxFit.cover),
                            Positioned(
                                right: 16,
                                top: 16,
                                child: Icon(
                                        event.fev!
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: event.fev! ? redColor : white,
                                        size: 22)
                                    .onTap(() {
                                  event.fev = !event.fev!;
                                  setState(() {});
                                })),
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(8),
                              decoration: boxDecorationWithRoundedCorners(
                                  backgroundColor: primaryColor1,
                                  borderRadius: radius(0)),
                              child: event.time == null
                                  ? const SizedBox()
                                  : Row(
                                      children: [
                                        const Icon(Icons.timer_sharp,
                                            color: white),
                                        10.width,
                                        Text(event.time.toString(),
                                            style:
                                                primaryTextStyle(color: white)),
                                      ],
                                    ),
                            ).visible(event.time != null),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(event.category!,
                                    style: secondaryTextStyle()),
                                Text('\$${event.price}',
                                    style: boldTextStyle(color: primaryColor1)),
                              ],
                            ),
                            4.height,
                            Text(event.name!, style: boldTextStyle()),
                            4.height,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RatingBarWidget(
                                  onRatingChanged: (rating) {},
                                  rating: event.rating!,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  size: 16,
                                  disable: true,
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
                                    const Icon(Icons.location_on_outlined,
                                        size: 16),
                                    8.width,
                                    Text(event.add!,
                                        style: secondaryTextStyle()),
                                  ],
                                ),
                                Text('${event.distance}km',
                                    style: secondaryTextStyle(
                                        color: primaryColor1)),
                              ],
                            ),
                            6.height,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.local_activity_outlined,
                                    size: 16),
                                8.width,
                                Text(event.attending!,
                                    style: secondaryTextStyle()),
                              ],
                            ),
                          ],
                        ).paddingAll(16)
                      ],
                    ).onTap(() => context.go(eventDetailsScreen, extra: event));
                  },
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            margin: const EdgeInsets.only(bottom: 16),
            decoration:
                boxDecorationRoundedWithShadow(20, backgroundColor: white),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Filter', style: primaryTextStyle()),
                8.width,
                const Icon(Icons.equalizer_rounded, size: 16),
              ],
            ),
          ).onTap(() => context.go(filtersScreen))
        ],
      ),
    );
  }
}
