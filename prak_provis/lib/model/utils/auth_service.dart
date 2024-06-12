class AuthService {
  static String token = "";
  static String email = "";
  static Map<String, dynamic> bookingData = {};

  static Future<void> setToken(String newToken) async {
    token = newToken;
    print("Token set to: $token"); // Tambahkan debug print
  }

  static Future<void> setEmail(String newEmail) async {
    email = newEmail;
    print("Email set to: $email"); // Tambahkan debug print
  }

  static Future<void> saveBookingData(Map<String, dynamic> data) async {
    bookingData = data;
    print("Booking data saved: $bookingData"); // Tambahkan debug print
  }

  static List<Map<String, dynamic>> _doctors = [
    {
      "id": 1,
      "name": "Dr. John Doe",
      "specialization": "Cardiology",
    },
    {
      "id": 2,
      "name": "Dr. Jane Smith",
      "specialization": "Neurology",
    },
    {
        "id": 3,
        "name": "Dr. Alice Williams",
        "specialization": "Dermatology",
    },
    {
        "id": 4,
        "name": "Dr. Robert Brown",
        "specialization": "Gastroenterology",
    },
    {
        "id": 5,
        "name": "Dr. Emily Davis",
        "specialization": "Pediatrics",
    },
    {
        "id": 6,
        "name": "Dr. Michael Wilson",
        "specialization": "Orthopedics",
    },
    {
        "id": 7,
        "name": "Dr. Sarah Johnson",
        "specialization": "Oncology",
    },
    {
        "id": 8,
        "name": "Dr. Daniel Moore",
        "specialization": "Ophthalmology",
    },
    {
        "id": 9,
        "name": "Dr. Laura Taylor",
        "specialization": "Psychiatry",
    },
    {
        "id": 10,
        "name": "Dr. David Anderson",
        "specialization": "General Surgery",
    }
  ];

  static String getDoctorNameById(int id) {
    // Cari dokter dengan ID yang sesuai
    var doctor = _doctors.firstWhere((doc) => doc['id'] == id, orElse: () => {});

    // Ambil nama dokter
    var doctorName = doctor['name'];

    // Kembalikan nama dokter
    return doctorName ?? '';
  }

  static String getDoctorSpecializationById(int id) {
  // Cari dokter dengan ID yang sesuai
  var doctor = _doctors.firstWhere((doc) => doc['id'] == id, orElse: () => {});

  // Ambil spesialisasi dokter
  var specialization = doctor['specialization'];

  // Kembalikan spesialisasi dokter
  return specialization ?? '';
}


  static String getToken() {
    return token;
  }

  static String getEmail() {
    return email;
  }

  static Map<String, dynamic> getBookingData() {
    return bookingData;
  }
}
