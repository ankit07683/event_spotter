import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_spotter/firebase-actions/firebase_actions.dart';
import 'package:event_spotter/providers/user.dart';
import 'package:event_spotter/service/routing_service.dart';
import 'package:event_spotter/utils/colors.dart';
import 'package:event_spotter/utils/data_provider.dart';
import 'package:event_spotter/widgets/app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class SelectIntrestsScreen extends ConsumerStatefulWidget {
  const SelectIntrestsScreen({super.key});

  @override
  ConsumerState<SelectIntrestsScreen> createState() =>
      _SelectIntrestsScreenState();
}

class _SelectIntrestsScreenState extends ConsumerState<SelectIntrestsScreen> {
  List<String> selectedIntrests = [];
  bool savingcategories = false;

  void saveIntrests() async {
    if (selectedIntrests.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Select atleast one category')));
    } else {
      try {
        setState(() {
          savingcategories = true;
        });
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({'intrests': selectedIntrests}, SetOptions(merge: true));

        ref.read(userProvider.notifier).saveUserIntrests(selectedIntrests);

        setState(() {
          savingcategories = false;
        });
        if (mounted) {
          context.go(selectIntrestsScreen);
        }
        if (mounted) {
          context.go(dashboardScreen);
        }
      } catch (err) {
        setState(() {
          savingcategories = false;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Error occured")));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Select Your Intrests", actions: [
        IconButton(
            onPressed: FirebaseHelper().logoutUser,
            icon: const Icon(Icons.logout))
      ]),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding:
                const EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 80),
            child: Wrap(
              runSpacing: 12,
              spacing: 16,
              children: List.generate(
                eventCategoriesList.length,
                (index) {
                  final category = eventCategoriesList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(category.image!,
                                  height: 250,
                                  width: context.width() * 0.43,
                                  fit: BoxFit.cover)
                              .cornerRadiusWithClipRRect(16),
                          Container(
                            height: 250,
                            width: context.width() * 0.43,
                            decoration: boxDecorationWithRoundedCorners(
                              borderRadius: radius(16),
                              gradient: selectedIntrests.contains(category.name)
                                  ? LinearGradient(colors: [
                                      primaryColor1.withOpacity(0.4),
                                      primaryColor2.withOpacity(0.4)
                                    ])
                                  : const LinearGradient(colors: [
                                      transparentColor,
                                      transparentColor
                                    ]),
                            ),
                          ),
                          Icon(Icons.check_circle_outline,
                              size: 30,
                              color: selectedIntrests.contains(category.name)
                                  ? white
                                  : transparentColor)
                        ],
                      ),
                      10.height,
                      Text(category.name!.toUpperCase(), style: boldTextStyle())
                          .paddingLeft(8),
                    ],
                  ).onTap(() {
                    if (selectedIntrests.contains(category.name)) {
                      setState(() {
                        selectedIntrests.remove(category.name!);
                      });
                    } else {
                      setState(() {
                        selectedIntrests.add(category.name!);
                      });
                    }
                  });
                },
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 4,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              width: context.width(),
              height: 50,
              decoration: boxDecorationWithShadow(
                  borderRadius: radius(24),
                  gradient: selectedIntrests.isEmpty
                      ? const LinearGradient(colors: [
                          Colors.grey,
                          Color.fromARGB(255, 216, 216, 216)
                        ])
                      : const LinearGradient(
                          colors: [primaryColor1, primaryColor2])),
              child: savingcategories
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text("Let's start!".toUpperCase(),
                      style: boldTextStyle(color: white, size: 18)),
            ).onTap(saveIntrests),
          ),
        ],
      ),
    );
  }
}
