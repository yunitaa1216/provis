// class UserProfile {
//   final String email;

//   UserProfile({required this.email});

//   factory UserProfile.fromJson(Map<String, dynamic> json) {
//     return UserProfile(
//       email: json['email'],
//     );
//   }
// }

import 'dart:math';

class UserProfile {
  final String email;
  final String profilePictureUrl;

  UserProfile({required this.email, required this.profilePictureUrl});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      email: json['email'],
      profilePictureUrl: json['profilePictureUrl'] ?? _getRandomProfilePicture(),
    );
  }

  static String _getRandomProfilePicture() {
    final random = Random();
    final imagePaths = [
      'assets/profil/1.png',
      'assets/profil/2.png',
      // Tambahkan path gambar lainnya di sini
    ];

    return imagePaths[random.nextInt(imagePaths.length)];
  }
}
