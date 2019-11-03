require 'rails_helper'

RSpec.describe Structure, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :height}
    it {should validate_presence_of :width}
    it {should validate_presence_of :length}
    it {should validate_presence_of :m_fare}
    it {should validate_presence_of :c_fare}
    it {should validate_presence_of :b_fare}
    it {should validate_presence_of :m_revenue}
    it {should validate_presence_of :c_revenue}
    it {should validate_presence_of :b_revenue}
  end

  describe 'Relationships' do
    it {should have_many :floors}
  end

  describe 'Uniqueness' do
    it 'cannot have two buildings with the same name' do
      expect(Structure.count).to eq(0)

      structure_1 = Structure.create!(name: 'One', height: 2, width: 3, length: 10)
      structure_2 = Structure.new(name: 'One', height: 2, width: 3, length: 10)

      expect(structure_2).to_not be_valid
      expect(structure_2.errors[:name]).to include("has already been taken")
      expect(structure_2.save).to eq(false)
      expect(Structure.count).to eq(1)
      expect(Floor.count).to eq(2)
    end
  end

  describe 'Instance methods' do
    before :each do
      @structure_1 = Structure.create!(name: 'Building A',
        height: 2, width: 3, length: 10,
        m_fare: 5, c_fare: 10, b_fare: 25,
        m_revenue: 100, c_revenue: 150, b_revenue: 125)
    end

    it 'can get total revenue' do
      expect(@structure_1.total_revenue).to eq(375)
    end
  end
end
