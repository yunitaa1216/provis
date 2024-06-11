'use strict';

/** @type {import('sequelize-cli').Migration} */
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert('doctors', [
      {
        name: 'Dr. John Doe',
        specialization: 'Cardiology',
        created_at: new Date(),
        updated_at: new Date()
      },
      {
        name: 'Dr. Jane Smith',
        specialization: 'Neurology',
        created_at: new Date(),
        updated_at: new Date()
      },
      {
        name: 'Dr. Alice Williams',
        specialization: 'Dermatology',
        created_at: new Date(),
        updated_at: new Date()
      },
      {
        name: 'Dr. Robert Brown',
        specialization: 'Gastroenterology',
        created_at: new Date(),
        updated_at: new Date()
      },
      {
        name: 'Dr. Emily Davis',
        specialization: 'Pediatrics',
        created_at: new Date(),
        updated_at: new Date()
      },
      {
        name: 'Dr. Michael Wilson',
        specialization: 'Orthopedics',
        created_at: new Date(),
        updated_at: new Date()
      },
      {
        name: 'Dr. Sarah Johnson',
        specialization: 'Oncology',
        created_at: new Date(),
        updated_at: new Date()
      },
      {
        name: 'Dr. Daniel Moore',
        specialization: 'Ophthalmology',
        created_at: new Date(),
        updated_at: new Date()
      },
      {
        name: 'Dr. Laura Taylor',
        specialization: 'Psychiatry',
        created_at: new Date(),
        updated_at: new Date()
      },
      {
        name: 'Dr. David Anderson',
        specialization: 'General Surgery',
        created_at: new Date(),
        updated_at: new Date()
      }
    ], {});
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('doctors', null, {});
  }
};

