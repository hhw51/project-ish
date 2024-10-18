import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataService {
  // Fetch and cache user data
  Future<Map<String, dynamic>?> fetchUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedUserData = prefs.getString('userData');

    if (cachedUserData != null) {
      // Load from cache
      return jsonDecode(cachedUserData);
    } else {
      // Fetch from Firestore
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (doc.exists) {
          Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
          await prefs.setString('userData', jsonEncode(userData)); // Cache data
          return userData;
        }
      }
    }
    return null;
  }

  // Clear the cache if needed (e.g., on logout)
  Future<void> clearCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userData');
  }
}
