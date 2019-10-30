require 'rails_helper'

RSpec.describe Row, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :letter}
    it {should validate_presence_of :length}
  end

  describe 'Relationships' do
    it {should belong_to :floor}
    it {should have_many :spots}
  end

  describe 'Uniqueness' do
    it 'cannot have two rows on the same floor with the same letter' do
      structure = Structure.create!(height: 3, width: 10, length: 10)
      floor_1 = structure.floors.create!(level: 1, width: 10, length: 10)
      floor_1.rows.create!(letter: 'A', length: 10)
      floor_2 = structure.floors.create!(level: 2, width: 10, length: 10)
      floor_2.rows.create!(letter: 'A', length: 10)

      expect(Row.count).to eq(2)

      row = floor_2.rows.new(letter: 'A', length: 10)
      expect(row).to_not be_valid
      expect(row.errors[:letter]).to include("has already been taken")

      expect(Row.count).to eq(2)
    end
  end
end
