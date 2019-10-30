require 'rails_helper'

RSpec.describe Floor, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :level}
    it {should validate_presence_of :width}
    it {should validate_presence_of :length}
    it {should validate_presence_of :m_fare}
    it {should validate_presence_of :c_fare}
    it {should validate_presence_of :b_fare}
  end

  describe 'Relationships' do
    it {should have_many :rows}
  end
end
