import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_spotter/model/user_modal.dart';
import 'package:event_spotter/providers/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod/riverpod.dart';

class FirebaseHelper {
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference chatsRef =
      FirebaseFirestore.instance.collection('chats');
  final CollectionReference messagesRef =
      FirebaseFirestore.instance.collection('messages');
  final CollectionReference userChatsRef =
      FirebaseFirestore.instance.collection('userChats');

  final _firebase = FirebaseAuth.instance;

  // Add a new user to Firestore
  Future<void> createUser(String email, String name, String password,
      String username, File userImage) async {
    try {
      final createdUser = await _firebase.createUserWithEmailAndPassword(
          email: email, password: password);

      final userImgRef = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('${createdUser.user!.uid}.jpg');

      await userImgRef.putFile(userImage);
      final iamgeUrl = await userImgRef.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(createdUser.user!.uid)
          .set({'username': username, 'email': email, 'image': iamgeUrl});
      final providerContainer = ProviderContainer();
      final userProviderRef = providerContainer.read(userProvider.notifier);
      userProviderRef.saveUserData(UserData(
        email: email,
        image: iamgeUrl,
        username: username,
        city: "",
        intrests: [],
      ));
      providerContainer.dispose();
    } on FirebaseAuthException catch (error) {
      throw error.message ?? 'Authentication failed.';
    }
  }

// login user
  Future<UserCredential> loginUser(
    String email,
    String password,
  ) async {
    try {
      final userdata = await _firebase.signInWithEmailAndPassword(
          email: email, password: password);
      return userdata;
    } on FirebaseAuthException catch (error) {
      // print('Login failed: $error');
      throw error.message ?? 'Authentication failed.';
    }
  }

// Add a new user to Firestore
  Future logoutUser() async {
    try {
      await _firebase.signOut();
    } on FirebaseAuthException catch (error) {
      // print('Login failed: $error');
      throw error.message ?? 'Authentication failed.';
    }
  }

// Add a new user to Firestore
  Future<dynamic> getCurrentUserDetails(
    String email,
  ) async {
    try {
      final userData = usersRef.where("email", isEqualTo: email).get();
      return userData;
    } catch (error) {
      // print('Login failed: $error');
      throw 'Unable to get user data';
    }
  }

  Future<dynamic> getUserDetailsByEmail(String email) async {
    try {
      print('emaoil $email');
      // Query to find the user with the provided email
      QuerySnapshot<Object?> snapshot =
          await usersRef.where('email', isEqualTo: email).get();

      // Check if any document matches the query
      if (snapshot.docs.isNotEmpty) {
        // Return the user details found
        print('data ${snapshot.docs}');
        return snapshot.docs.first.data();
      } else {
        // If no matching user found, return null
        return null;
      }
    } catch (error) {
      // Handle any errors that occur during the process
      print('Error retrieving user details: $error');
      return null;
    }
  }

  // Add a new user to Firestore
  Future<void> addUser(String userId, String username, String email) async {
    try {
      await usersRef.doc(userId).set({
        'username': username,
        'email': email,
        // Other user information
      });
    } catch (e) {
      print('Error adding user: $e');
      rethrow;
    }
  }

  // Create a new chat room in Firestore
  Future<void> createChat(
      String chatId, String chatName, String createdBy) async {
    try {
      await chatsRef.doc(chatId).set({
        'chatName': chatName,
        'createdBy': createdBy,
        // Other chat information
      });
    } catch (e) {
      print('Error creating chat: $e');
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }

  // Send a message to a chat room in Firestore
  Future<void> sendMessage(String messageId, String chatId, String senderId,
      String messageContent, Timestamp timestamp) async {
    try {
      await messagesRef.doc(messageId).set({
        'chatId': chatId,
        'senderId': senderId,
        'messageContent': messageContent,
        'timestamp': timestamp,
        // Other message information
      });
    } catch (e) {
      print('Error sending message: $e');
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }

  // Add a user's chat in Firestore
  Future<void> addUserChat(
      String userId, String chatId, String lastReadMessageId) async {
    try {
      await userChatsRef.doc(userId).collection('chats').doc(chatId).set({
        'lastReadMessageId': lastReadMessageId,
      });
    } catch (e) {
      print('Error adding user to chat: $e');
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
