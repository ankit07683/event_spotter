import 'package:event_spotter/firebase-actions/firebase_actions.dart';
import 'package:event_spotter/model/user_modal.dart';
import 'package:event_spotter/providers/user.dart';
import 'package:event_spotter/service/routing_service.dart';
import 'package:event_spotter/utils/Constants.dart';
import 'package:event_spotter/utils/colors.dart';
import 'package:event_spotter/utils/images_mapping.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(transparentColor);
    await 1.seconds.delay;
    String screenToRedirect = loginScreen;
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null && currentUser.email!.isNotEmpty) {
      final userDetails = await FirebaseHelper()
          .getUserDetailsByEmail(currentUser.email!.toString());

      // save to state
      ref.read(userProvider.notifier).saveUserData(UserData(
          email: userDetails["email"],
          username: userDetails["username"],
          image: userDetails["image"],
          city: userDetails["city"],
          intrests:
              (userDetails["interests"] as List<dynamic>?)?.cast<String>()));

      screenToRedirect = getRedirectionScreenName(userDetails);
    }

    if (mounted) {
      finish(context);
      context.go(screenToRedirect);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(imgAppLogo, height: 200, fit: BoxFit.cover),
              20.height,
              Text(app_name,
                  style: GoogleFonts.acme(fontSize: 40, color: primaryColor1)),
              20.height,
              Text(
                app_tagline,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ).paddingOnly(left: 16, right: 16),
          Positioned(
            bottom: 20, // Adjust bottom padding
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Created with passion, by Ankit Jain',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
