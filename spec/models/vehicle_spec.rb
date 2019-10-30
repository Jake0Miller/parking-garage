require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :width}
  end

  describe 'Relationships' do
    it {should have_many :spots}
  end
end
