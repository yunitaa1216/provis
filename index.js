const express = require('express');
const cors = require('cors');
const app = express();
const bodyParser = require('body-parser');
const db = require('./models');
const { Doctors, Appointments, Users } = db;
const bcrypt = require("bcrypt");
const cookieParser = require("cookie-parser");
const { createTokens, validateToken } = require("./JWT");

app.use(express.json());
app.use(cookieParser());
app.use(bodyParser.json());
app.use(cors());

// Define available times
const availableTimes = ["09:00", "11:00", "13:00", "15:00", "17:00"];

app.post("/register", async (req, res) => {
  const {
    nama_lengkap,
    no_hp,
    tanggal_lahir,
    email,
    kata_sandi,
    konfirmasi_kata_sandi,
  } = req.body;

  if (
    !nama_lengkap ||
    !no_hp ||
    !tanggal_lahir ||
    !email ||
    !kata_sandi ||
    !konfirmasi_kata_sandi
  ) {
    return res.status(400).json({ error: "Semua kolom wajib diisi" });
  }

  if (kata_sandi !== konfirmasi_kata_sandi) {
    return res
      .status(400)
      .json({ error: "Kata sandi tidak cocok dengan konfirmasi kata sandi" });
  }

  try {
    const existingUser = await Users.findOne({ where: { email: email } });
    if (existingUser) {
      return res.status(400).json({ error: "Email sudah terdaftar" });
    }

    const hash = await bcrypt.hash(kata_sandi, 10);
    const newUser = await Users.create({
      nama_lengkap: nama_lengkap,
      no_hp: no_hp,
      tanggal_lahir: tanggal_lahir,
      email: email,
      kata_sandi: hash,
    });
    
    // Log the new user data
    console.log("User created: ", newUser);

    res.json({ error: false, message: "User Created" });
  } catch (err) {
    console.error('Error creating user: ', err);
    res.status(500).json({
      error: true,
      message: err.message || "Gagal mendaftarkan pengguna",
    });
  }
});


app.post("/login", async (req, res) => {
  const { email, kata_sandi } = req.body;
  try {
    const user = await Users.findOne({ where: { email: email } });
    if (!user) {
      return res
        .status(400)
        .json({ error: true, message: "Pengguna Tidak Ditemukan" });
    }

    const match = await bcrypt.compare(kata_sandi, user.kata_sandi);
    if (!match) {
      return res.status(400).json({
        error: true,
        message: "Kombinasi Email dan Kata Sandi Salah!",
      });
    }

    const accessToken = createTokens(user);

    res.cookie("access-token", accessToken, {
      maxAge: 60 * 60 * 24 * 30 * 1000,
      httpOnly: true,
    });

    res.json({
      error: false,
      message: "success",
      loginResult: {
        userId: user.id,
        name: user.nama_lengkap,
        token: accessToken,
      },
    });
  } catch (err) {
    res
      .status(400)
      .json({ error: true, message: err.message || "Gagal masuk" });
  }
});

app.get("/profile", validateToken, (req, res) => {
  try {
    // Dapatkan informasi pengguna dari token yang valid
    const user = req.authData;

    // Di sini, Anda dapat menyesuaikan dengan cara mendapatkan informasi profil yang sesuai
    // Misalnya, Anda dapat melakukan query ke database atau menggunakan informasi yang sudah ada
    // Di contoh ini, kita hanya mengembalikan beberapa informasi pengguna
    const userProfile = {
      id: user.id,
      nama_lengkap: user.nama_lengkap,
      email: user.email,
    };

    res.status(200).json({ message: "Profil berhasil diambil", userProfile });
  } catch (err) {
    res.status(400).json({ error: err.message || "Gagal mengambil profil" });
  }
});

app.get('/doctors', async (req, res) => {
  try {
    const doctors = await Doctors.findAll();
    res.json(doctors);
  } catch (error) {
    console.error("Error fetching doctors: ", error);
    res.status(500).json({ error: 'Failed to fetch doctors' });
  }
});

app.post('/appointments', async (req, res) => {
  const { doctor_id, date, time } = req.body;
  // let userId = req.authData.id; // Menggunakan id dari user yang terautentikasi
  // let userId = null;

  if (!availableTimes.includes(time)) {
    return res.status(400).json({ error: "Invalid time slot selected. Please select one of the following times: 09:00, 11:00, 13:00, 15:00, 17:00." });
  }

  try {
    const doctor = await Doctors.findByPk(doctor_id);
    if (!doctor) {
      return res.status(404).json({ message: 'Doctor not found' });
    }

    const isBooked = await Appointments.findOne({
      where: {
        doctor_id,
        date,
        time,
        // userId // Pastikan yang booking adalah user yang sama
      }
    });

    if (isBooked) {
      return res.status(400).json({ message: 'This time slot is already booked. Please choose another time.' });
    }

    const appointment = await Appointments.create({
      doctor_id,
      // userId,
      date,
      time,
    });

    res.json({
      message: "Appointment booked successfully.",
      details: {
        id: appointment.id,
        doctorName: doctor.name,
        date: appointment.date,
        time: appointment.time
      }
    });
  } catch (error) {
    res.status(500).json({ error: 'Failed to create appointment' });
    console.error('Failed to create appointment:', error);
  }
});

app.get('/appointments/:id', validateToken, async (req, res) => {
  const { id } = req.params;
  // const userId = req.authData.id; // Menggunakan id dari user yang terautentikasi

  try {
    const appointment = await Appointments.findOne({
      where: {
        id,
        // userId // Pastikan hanya user yang membuat appointment yang dapat melihatnya
      },
      include: [Doctors]
    });

    if (!appointment) {
      return res.status(404).json({ message: 'Appointment not found' });
    }

    res.json({
      message: "Appointment retrieved successfully.",
      details: {
        id: appointment.id,
        doctorName: appointment.Doctors.name,
        date: appointment.date,
        time: appointment.time
      }
    });
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch appointment' });
  }
});

db.sequelize.sync().then(() => {
  app.listen(3000, () => {
    console.log('Server running on port 3000');
  });
});
