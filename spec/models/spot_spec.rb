require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :number}
    it {should validate_presence_of :width}
  end

  describe 'Relationships' do
    it {should belong_to :row}
    it {should belong_to(:vehicle).optional}
  end

  describe 'Uniqueness' do
    it 'cannot have two spots in the same row with the same number' do
      structure = Structure.create!(name: 'One', height: 2, width: 3, length: 10)
      floor_1 = structure.floors.first
      row_1 = floor_1.rows.first

      expect(row_1.spots.length).to eq(4)
      expect(Spot.count).to eq(24)

      spot = row_1.spots.new(number: 1, width: 2)

      expect(spot).to_not be_valid
      expect(spot.errors[:number]).to include("has already been taken")
      expect(spot.save).to eq(false)
      expect(Spot.count).to eq(24)
    end
  end
end
