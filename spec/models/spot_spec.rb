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
      structure = Structure.create!(name: 'One', height: 3, width: 10, length: 10)
      floor_1 = structure.floors.first
      row_1 = floor_1.rows.create!(letter: 'A', length: 10)
      row_1.spots.create!(number: 1, width: 2)
      row_2 = floor_1.rows.create!(letter: 'B', length: 10)
      row_2.spots.create!(number: 1, width: 2)

      expect(Spot.count).to eq(2)

      spot = row_2.spots.new(number: 1, width: 3)
      expect(spot).to_not be_valid
      expect(spot.errors[:number]).to include("has already been taken")

      expect(Spot.count).to eq(2)
    end
  end
end
