require 'rails_helper'

RSpec.describe Row, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :letter}
    it {should validate_presence_of :length}
  end

  describe 'Relationships' do
    it {should have_many :spots}
  end
end
