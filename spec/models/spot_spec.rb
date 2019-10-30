require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :width}
  end

  describe 'Relationships' do
    it {should belong_to :vehicle}
  end
end
