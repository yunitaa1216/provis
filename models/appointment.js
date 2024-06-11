'use strict';
module.exports = (sequelize, DataTypes) => {
  const Appointment = sequelize.define("Appointment", {
    doctor_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'doctors',
        key: 'id'
      }
    },
    // userId: {
    //   type: DataTypes.INTEGER,
    //   allowNull: true,
    // },
    time: {
      type: DataTypes.TIME,
      allowNull: false,
    },
    date: {
      type: DataTypes.DATEONLY,
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

  Appointment.associate = (models) => {
    Appointment.belongsTo(models.Doctors, { foreignKey: 'doctor_id', as: 'doctor' });
  };
  
  return Appointment;
};
