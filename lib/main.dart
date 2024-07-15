import 'package:event_spotter/service/routing_service.dart';
import 'package:event_spotter/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GoRouter router = RoutingService().router;
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    router.refresh();
  });
  runApp(ProviderScope(child: MyApp(router: router)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});

  final GoRouter router;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: ThemeData().copyWith(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 203, 3, 3))),
        title: app_name,
        debugShowCheckedModeBanner: false,
        routerConfig: router);
  }
}

// MaterialApp(
//         theme: ThemeData().copyWith(
//             colorScheme: ColorScheme.fromSeed(
//                 seedColor: const Color.fromARGB(255, 203, 3, 3))),
//         title: app_name,
//         debugShowCheckedModeBanner: false,
//         home: StreamBuilder(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             builder: (ctx, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const SplashScreen();
//               }
//               if (snapshot.hasData) {
//                 return const RedirectUser();
//                 // return const EAWalkThroughScreen();
//               }
//               return const AuthScreen();
//             }));
