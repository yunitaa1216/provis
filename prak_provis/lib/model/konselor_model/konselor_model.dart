class KonselorModel {
  final int id;
  final String firstName;
  final String lastName;
  final String description;
  final String status;
  final String profilePicture;
  final String education;

  KonselorModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.description,
    required this.status,
    required this.profilePicture,
    required this.education,
  });

  factory KonselorModel.fromJson(Map<String, dynamic> json) {
    return KonselorModel(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      description: json["description"],
      status: json["status"],
      profilePicture: json["profile_picture"],
      education: json["education"] ?? "Psikologi • Universitas Indonesia",
    );
  }

  static List<int> scheduleFromJson(List json) {
    final Map<String, int> listHari = {
      "Senin": DateTime.monday,
      "Selasa": DateTime.tuesday,
      "Rabu": DateTime.wednesday,
      "Kamis": DateTime.thursday,
      "Jumat": DateTime.friday,
      "Sabtu": DateTime.saturday,
      "Minggu": DateTime.sunday,
    };

    List<int> schedule =
        json.map((e) => listHari[e["day_schedule"]] ?? -1).toList();
    return schedule;
  }
}
