import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_spotter/firebase-actions/firebase_actions.dart';
import 'package:event_spotter/model/EAWalkThroughModel.dart';
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

class SelectCityScreen extends ConsumerStatefulWidget {
  const SelectCityScreen({super.key});

  @override
  ConsumerState<SelectCityScreen> createState() => _SelectCityScreenState();
}

class _SelectCityScreenState extends ConsumerState<SelectCityScreen> {
  TextEditingController searchController = TextEditingController();
  bool savingCity = false;
  int selectCity = 0;

  void saveCity() async {
    final String cityName = cityList[selectCity].name!;
    try {
      setState(() {
        savingCity = true;
      });
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({'city': cityName}, SetOptions(merge: true));

      ref.read(userProvider.notifier).saveUserCity(cityName);
      setState(() {
        savingCity = false;
      });
      if (mounted) {
        context.go(selectIntrestsScreen);
      }
    } catch (err) {
      setState(() {
        savingCity = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Error occured")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<CityModel> filteredList = cityList;
    if (searchController.text.isNotEmpty) {
      filteredList = cityList
          .where((city) => city.name!
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }

    return Scaffold(
      appBar: getAppBar("Select City", actions: [
        IconButton(
            onPressed: FirebaseHelper().logoutUser,
            icon: const Icon(Icons.logout))
      ]),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: boxDecorationWithShadow(
                      backgroundColor: white,
                      shadowColor: grey.withOpacity(0.3)),
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, size: 30),
                      hintText: 'Search city',
                    ),
                  ),
                ),
                Wrap(
                  runSpacing: 12,
                  spacing: 16,
                  children: List.generate(
                    filteredList.length,
                    (index) {
                      final city = filteredList[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(city.image!,
                                      height: 250,
                                      width: context.width() * 0.43,
                                      fit: BoxFit.cover)
                                  .cornerRadiusWithClipRRect(16),
                              Container(
                                height: 250,
                                width: context.width() * 0.43,
                                decoration: boxDecorationWithRoundedCorners(
                                  borderRadius: radius(16),
                                  gradient: selectCity == index
                                      ? LinearGradient(
                                          colors: [
                                            primaryColor1.withOpacity(0.4),
                                            primaryColor2.withOpacity(0.4),
                                          ],
                                        )
                                      : const LinearGradient(
                                          colors: [
                                            transparentColor,
                                            transparentColor
                                          ],
                                        ),
                                ),
                              ),
                              Icon(Icons.check_circle_outline,
                                  size: 30,
                                  color: selectCity == index
                                      ? white
                                      : transparentColor)
                            ],
                          ),
                          10.height,
                          Text(city.name!.toUpperCase(), style: boldTextStyle())
                              .paddingLeft(8),
                        ],
                      ).onTap(() {
                        selectCity = index;
                        setState(() {});
                      });
                    },
                  ),
                ).paddingAll(16),
                70.height,
              ],
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
                  gradient: const LinearGradient(
                      colors: [primaryColor1, primaryColor2])),
              child: savingCity
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text('Next'.toUpperCase(),
                      style: boldTextStyle(color: white, size: 18)),
            ).onTap(() {
              saveCity();
            }),
          ),
        ],
      ),
    );
  }
}
