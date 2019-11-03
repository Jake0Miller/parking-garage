require 'rails_helper'

RSpec.describe 'Structures show' do
  include ActionView::Helpers::NumberHelper

  before :each do
    @structure_1 = Structure.create!(name: 'Building A',
      height: 2, width: 3, length: 10,
      m_fare: 5, c_fare: 10, b_fare: 25,
      m_revenue: 100, c_revenue: 150, b_revenue: 125)
  end

  it 'I can see a structure as a visitor' do
    visit root_path

    click_on 'Parking Visitor'

    within 'nav' do
      click_on 'Browse'
    end

    click_on @structure_1.name

    expect(page).to have_content(@structure_1.name)
    expect(page).to have_content("Number of Floors: #{@structure_1.height}")
  end

  it 'I can see a structure as an admin' do
    visit root_path

    click_on 'Parking Admin'

    within 'nav' do
      click_on 'Browse'
    end

    click_on @structure_1.name

    expect(page).to have_content(@structure_1.name)
    expect(page).to have_content("Number of Floors: #{@structure_1.height}")
    expect(page).to have_content("Parking Rates:")
    expect(page).to have_content("Motorcycle: #{number_to_currency(@structure_1.m_fare)}")
    expect(page).to have_content("Car: #{number_to_currency(@structure_1.c_fare)}")
    expect(page).to have_content("Bus: #{number_to_currency(@structure_1.b_fare)}")
    expect(page).to have_content("Total Revenue: #{number_to_currency(@structure_1.total_revenue)}")
    expect(page).to have_content("Motorcycle Revenue: #{number_to_currency(@structure_1.m_revenue)}")
    expect(page).to have_content("Car Revenue: #{number_to_currency(@structure_1.c_revenue)}")
    expect(page).to have_content("Bus Revenue: #{number_to_currency(@structure_1.b_revenue)}")
  end
end
