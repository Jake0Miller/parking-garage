# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@structure_1 = Structure.create!(name: 'Building A',
  height: 2, width: 3, length: 20,
  m_fare: 5, c_fare: 10, b_fare: 25,
  m_revenue: 0, c_revenue: 0, b_revenue: 0)
@structure_2 = Structure.create!(name: 'Building B',
  height: 3, width: 3, length: 30,
  m_fare: 5, c_fare: 10, b_fare: 25,
  m_revenue: 0, c_revenue: 0, b_revenue: 0)
@structure_3 = Structure.create!(name: 'Building C',
  height: 4, width: 3, length: 22,
  m_fare: 5, c_fare: 10, b_fare: 25,
  m_revenue: 0, c_revenue: 0, b_revenue: 0)
