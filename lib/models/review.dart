import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String reviewerId;
  final String reviewedUserId;
  final double rating;
  final Timestamp createdAt;

  Review({
    required this.reviewerId,
    required this.reviewedUserId,
    required this.rating,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      reviewerId: json['reviewerId'] ?? '',
      reviewedUserId: json['reviewedUserId'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      createdAt: json['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reviewerId': reviewerId,
      'reviewedUserId': reviewedUserId,
      'rating': rating,
      'createdAt': createdAt,
    };
  }
}