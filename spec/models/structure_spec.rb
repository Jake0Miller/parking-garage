require 'rails_helper'

RSpec.describe Structure, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :height}
    it {should validate_presence_of :width}
    it {should validate_presence_of :length}
  end

  describe 'Relationships' do
    it {should have_many :floors}
  end
end
