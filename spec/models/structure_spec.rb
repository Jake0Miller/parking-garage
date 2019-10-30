require 'rails_helper'

RSpec.describe Structure, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_uniqueness_of :name}
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
end
