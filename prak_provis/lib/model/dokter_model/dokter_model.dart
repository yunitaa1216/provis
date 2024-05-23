class KonselorModel {
  final int id;
  final String name;
  final String description;
  final String status;
  final String profilePicture;
  final String education;

  KonselorModel({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.profilePicture,
    required this.education,
  });

  factory KonselorModel.fromJson(Map<String, dynamic> json) {
    return KonselorModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      status: json["status"],
      profilePicture: json["profile_picture"],
      education: json["education"] ?? "Psikologi • Universitas Indonesia",
    );
  }
}