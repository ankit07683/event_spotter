import 'package:event_spotter/service/routing_service.dart';
import 'package:event_spotter/widgets/app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Search Events', actions: [
        IconButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: const Icon(Icons.logout))
      ]),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
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
                const Icon(
                  Icons.equalizer_rounded,
                  size: 16,
                ),
              ],
            ),
          ).onTap(() => context.go(filtersScreen))
        ],
      ),
    );
  }
}
