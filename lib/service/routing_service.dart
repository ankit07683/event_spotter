import 'package:event_spotter/model/event_modal.dart';
import 'package:event_spotter/screens/chat_screen.dart';
import 'package:event_spotter/screens/dashboard_scren.dart';
import 'package:event_spotter/screens/auth_scren.dart';
import 'package:event_spotter/screens/event_details_screen.dart';
import 'package:event_spotter/screens/filter_screen.dart';
import 'package:event_spotter/screens/inbox_screen.dart';
import 'package:event_spotter/screens/locations_screen.dart';
import 'package:event_spotter/screens/news_details_screen.dart';
import 'package:event_spotter/screens/notifications_screen.dart';
import 'package:event_spotter/screens/select_city_screen.dart';
import 'package:event_spotter/screens/select_intrested_event_types.dart';
import 'package:event_spotter/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

String splashScreen = '/';
String loginScreen = '/login';
String selectCityScreen = '/select-city';
String selectIntrestsScreen = '/select-intrests';
String dashboardScreen = '/dashboard';
String eventDetailsScreen = '/event-details';
String inboxScreen = '/inbox';
String chatScreen = '/chat';
String notificationsScreen = '/notifications';
String filtersScreen = '/filters';
String locationsScreen = '/locations';
String reviewsScreen = '/reviews';
String newsDetailsScreen = '/news-details';

String getRedirectionScreenName(userDetails) {
  String redirecTo = loginScreen;
  if (userDetails == null) {
    redirecTo = loginScreen;
  } else {
    redirecTo = selectCityScreen;
    if (userDetails['city'] != null && userDetails['intrests'] != null) {
      redirecTo = dashboardScreen;
    } else if (userDetails['city'] != null) {
      redirecTo = selectIntrestsScreen;
    }
  }
  return redirecTo;
}

class RoutingService {
  final router = GoRouter(
    initialLocation: splashScreen,
    routes: <GoRoute>[
      GoRoute(
        path: splashScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        path: loginScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const AuthScreen(),
      ),
      GoRoute(
          path: '$dashboardScreen/:selectedScreen',
          builder: (BuildContext context, GoRouterState state) {
            final selectedScreen = state.pathParameters['selectedScreen'] ?? '';
            return DashedBoardScreen(
              selectedScreen: selectedScreen,
            );
          }),
      GoRoute(
          path: dashboardScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const DashedBoardScreen();
          }),
      GoRoute(
        path: selectCityScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const SelectCityScreen(),
      ),
      GoRoute(
        path: selectIntrestsScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const SelectIntrestsScreen(),
      ),
      GoRoute(
        path: inboxScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const InboxScreen(),
      ),
      GoRoute(
          path: '$chatScreen/:userId',
          builder: (BuildContext context, GoRouterState state) {
            final userId = state.pathParameters['userId'] ?? '';
            final name = state.pathParameters['name'] ?? '';
            return ChatScreen(userId: userId, name: name);
          }),
      GoRoute(
          path: eventDetailsScreen,
          pageBuilder: (BuildContext context, GoRouterState state) {
            String name = "";
            String category = "";
            String attending = "";
            String price = "";
            String image = "";
            if (state.extra != null) {
              final event = state.extra as EventItem;
              name = event.name ?? "";
              category = event.category ?? "";
              attending = event.attending ?? "";
              price = event.price ?? "";
              image = event.image ?? "";
            }
            return CustomTransitionPage(
                child: EventDetailScreen(
                  name: name,
                  category: category,
                  attending: attending,
                  price: price,
                  image: image,
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 1.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                });
          }),
      GoRoute(
          path: notificationsScreen,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
                child: const NotificationsScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 1.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                });
          }),
      GoRoute(
          path: locationsScreen,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
                child: const LocationScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 1.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                });
          }),
      GoRoute(
          path: locationsScreen,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
                child: const LocationScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 1.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                });
          }),
      GoRoute(
          path: filtersScreen,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
                child: const FilterScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 1.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                });
          }),
      GoRoute(
          path: newsDetailsScreen,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
                child: const NewsDetailScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 1.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                });
          }),
    ],

    // redirect to the login page if the user is not logged in
    redirect: (BuildContext context, GoRouterState state) async {
      if (state.fullPath == splashScreen) {
        return null;
      }
      final bool loggedIn = FirebaseAuth.instance.currentUser != null;
      final bool loggingIn = state.matchedLocation == loginScreen;
      if (!loggedIn) return loginScreen;
      if (loggingIn) return dashboardScreen;
      // no need to redirect at all
      return null;
    },
  );
}
