require 'rails_helper'

RSpec.describe 'Park vehicles' do
  before :each do
    @structure_1 = Structure.create!(name: 'Building A',
      height: 2, width: 3, length: 10,
      m_fare: 5, c_fare: 10, b_fare: 25,
      m_revenue: 100, c_revenue: 150, b_revenue: 125)
  end

  it 'I can park a motorcycle' do
    visit root_path
    click_on 'Parking Visitor'
    visit structure_path(@structure_1)
    select '1', :from => "floor[id]"
    click_on 'View'
    click_on '🏍'

    expect(@structure_1.m_revenue).to eq(105)
  end

  it 'I can park a car' do
    visit root_path
    click_on 'Parking Visitor'
    visit structure_path(@structure_1)
    select '1', :from => "floor[id]"
    click_on 'View'
    click_on '🚗'
  end

  it 'I can park a bus' do
    visit root_path
    click_on 'Parking Visitor'
    visit structure_path(@structure_1)
    select '1', :from => "floor[id]"
    click_on 'View'
    click_on '🚌'
  end
end
