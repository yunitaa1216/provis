class Doctor {
  final String name;
  final String specialization;
  // Tambahkan field lain yang diperlukan

  Doctor({required this.name, required this.specialization});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialization: json['specialization'],
      // Inisialisasi field lain yang diperlukan
    );
  }
}
