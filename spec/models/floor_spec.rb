require 'rails_helper'

RSpec.describe Floor, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :level}
    it {should validate_presence_of :width}
    it {should validate_presence_of :length}
  end

  describe 'Relationships' do
    it {should belong_to :structure}
    it {should have_many :rows}
  end

  describe 'Uniqueness' do
    it 'cannot have two floors on the same level' do
      structure_1 = Structure.create!(name: 'One', height: 3, width: 10, length: 10)
      structure_1.floors.create!(level: 1, width: 10, length: 10)
      structure_2 = Structure.create!(name: 'Two', height: 3, width: 10, length: 10)
      structure_2.floors.create!(level: 1, width: 10, length: 10)

      expect(Floor.count).to eq(2)

      floor = structure_1.floors.new(level: 1, width: 10, length: 10)
      expect(floor).to_not be_valid
      expect(floor.errors[:level]).to include("has already been taken")

      expect(Floor.count).to eq(2)
    end
  end
end
