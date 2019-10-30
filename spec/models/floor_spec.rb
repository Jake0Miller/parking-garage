require 'rails_helper'

RSpec.describe Floor, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :level}
    it {should validate_uniqueness_of :level}
    it {should validate_presence_of :width}
    it {should validate_presence_of :length}
  end

  describe 'Relationships' do
    it {should belong_to :structure}
    it {should have_many :rows}
  end

  describe 'Uniqueness' do
    it 'cannot have two floors on the same level' do
      structure = Structure.create!(height: 3, width: 10, length: 10)

      expect(Floor.count).to eq(0)

      structure.floors.create!(level: 1, width: 10, length: 10)

      expect(Floor.count).to eq(1)

      floor = structure.floors.new(level: 1, width: 10, length: 10)
      expect(floor).to_not be_valid
      expect(floor.errors[:level]).to include("has already been taken")

      expect(Floor.count).to eq(1)
    end
  end
end
