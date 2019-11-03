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
      structure = Structure.create!(name: 'One', height: 3, width: 10, length: 10)

      expect(Row.count).to eq(30)

      row = structure.floors.second.rows.new(letter: 'A', length: 10)
      expect(row).to_not be_valid
      expect(row.errors[:letter]).to include("has already been taken")
      expect(row.save).to eq(false)
      expect(Row.count).to eq(30)
    end
  end
end
