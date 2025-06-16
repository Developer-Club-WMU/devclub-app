import 'package:firebase_auth/firebase_auth.dart';

class Member {
  
  // TODO: Add all the fields that the business/technical requirements specify
  // Constructor
  const Member ({
    required this.id,
    required this.email,
    this.emailVerified = false,
    this.displayName,
    this.roleId,
    this.isActive,
    this.createdAt, 

  });

  // Properties
  final String id;
  final String? email;
  final bool emailVerified;
  final String? displayName;
  final String? roleId;
  final bool? isActive;
  final DateTime? createdAt;

  // Methods
  /// This function map the Firebase User to our User dart model
  static Member? fromUser(User? user) {
    if (user == null) {
      return null;
    }
    return Member(
      id: user.uid,
      email: user.email,
      emailVerified: user.emailVerified,
      displayName: user.displayName,
    );
  }
}