import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';
import 'package:event_spotter/model/user_modal.dart';

final _firebase = FirebaseAuth.instance;

class UsersNotifier extends StateNotifier<UserState> {
  UsersNotifier() : super(UserState(loading: false, userData: null));

  void saveUserData(UserData userDetails) {
    state = UserState(loading: false, userData: userDetails);
  }

  void saveUserCity(String city) {
    final data = state.userData;
    data!.city = city;
    state = UserState(loading: false, userData: data);
  }

  void saveUserIntrests(List<String> intrests) {
    final data = state.userData;
    data!.intrests = intrests;
    state = UserState(loading: false, userData: data);
  }

  void logOutUser() async {
    state = UserState(loading: true, userData: state.userData);
    await _firebase.signOut();
    state = UserState(loading: false, userData: null);
  }
}

final userProvider = StateNotifierProvider<UsersNotifier, UserState>(
  (ref) => UsersNotifier(),
);
