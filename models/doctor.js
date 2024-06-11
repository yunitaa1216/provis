'use strict';
module.exports = (sequelize, DataTypes) => {
  const Doctors = sequelize.define("Doctors", {
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    specialization: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    createdAt: {
      type: DataTypes.DATE,
      field: 'created_at',
      allowNull: false,
    },
    updatedAt: {
      type: DataTypes.DATE,
      field: 'updated_at',
      allowNull: false,
    },
  });

  Doctors.associate = (models) => {
    Doctors.hasMany(models.Appointment, { foreignKey: 'doctor_id', as: 'appointments' });
  };

  return Doctors;
};
