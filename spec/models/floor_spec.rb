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
end
