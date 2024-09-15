import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/review.dart';
import '../models/user.dart';
import '../utils/firebase.dart';
import 'services.dart';
class UserService extends Service {
  //get the authenticated uis
  String currentUid() {
    return firebaseAuth.currentUser!.uid;
  }

//tells when the user is online or not and updates the last seen for the messages
  setUserStatus(bool isOnline) {
    var user = firebaseAuth.currentUser;
    if (user != null) {
      usersRef
          .doc(user.uid)
          .update({'isOnline': isOnline, 'lastSeen': Timestamp.now()});
    }
  }
  Future<void> addReview(Review review) async {
    // Check if the user has already reviewed
    var existingReview = await reviewsRef
        .where('reviewerId', isEqualTo: review.reviewerId)
        .where('reviewedUserId', isEqualTo: review.reviewedUserId)
        .get();

    if (existingReview.docs.isEmpty) {
      await reviewsRef.add(review.toJson());
      await updateAverageRating(review.reviewedUserId);
    }
  }

  Future<void> updateAverageRating(String userId) async {
    QuerySnapshot reviewsSnapshot = await reviewsRef
        .where('reviewedUserId', isEqualTo: userId)
        .get();

    if (reviewsSnapshot.docs.isNotEmpty) {
      double totalRating = 0;
      reviewsSnapshot.docs.forEach((doc) {
        totalRating += (doc.data() as Map<String, dynamic>)['rating'];
      });
      double averageRating = totalRating / reviewsSnapshot.docs.length;

      await usersRef.doc(userId).update({'averageRating': averageRating});
    }
  }
  Future<double?> getUserRating(String userId) async {
    DocumentSnapshot userDoc = await usersRef.doc(userId).get();
    return (userDoc.data() as Map<String, dynamic>?)?['averageRating'];
  }

  Future<bool> hasUserReviewed(String reviewerId, String reviewedUserId) async {
    var existingReview = await reviewsRef
        .where('reviewerId', isEqualTo: reviewerId)
        .where('reviewedUserId', isEqualTo: reviewedUserId)
        .get();
    return existingReview.docs.isNotEmpty;
  }

  // Stream<List<Review>> getUserReviews(String userId) {
  //   return reviewsRef
  //       .where('reviewedUserId', isEqualTo: userId)
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs
  //       .map((doc) => Review.fromJson(doc.data() as Map<String, dynamic>))
  //       .toList());
  // }

  Future<void> transferCoins(String senderId, String receiverId, int amount) async {
    WriteBatch batch = firestore.batch();

    DocumentReference senderRef = usersRef.doc(senderId);
    DocumentReference receiverRef = usersRef.doc(receiverId);

    DocumentSnapshot senderSnapshot = await senderRef.get();
    DocumentSnapshot receiverSnapshot = await receiverRef.get();

    UserModel sender = UserModel.fromJson(senderSnapshot.data() as Map<String, dynamic>);
    UserModel receiver = UserModel.fromJson(receiverSnapshot.data() as Map<String, dynamic>);

    if (sender.coins >= amount) {
      batch.update(senderRef, {'coins': sender.coins - amount});
      batch.update(receiverRef, {'coins': receiver.coins + amount});

      await batch.commit();
    } else {
      throw Exception('Insufficient coins');
    }
  }

//updates user profile in the Edit Profile Screen
  updateProfile(
      {File? image, String? username, String? bio, String? country}) async {
    DocumentSnapshot doc = await usersRef.doc(currentUid()).get();
    var users = UserModel.fromJson(doc.data() as Map<String, dynamic>);
    users.username = username;
    users.bio = bio;
    users.country = country;
    if (image != null) {
      users.photoUrl = await uploadImage(profilePic, image);
    }
    await usersRef.doc(currentUid()).update({
      'username': username,
      'bio': bio,
      'country': country,
      "photoUrl": users.photoUrl ?? '',
    });

    return true;
  }
}
