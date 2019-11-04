require 'rails_helper'

RSpec.describe 'Floor show' do
  before :each do
    @structure_1 = Structure.create!(name: 'Building A',
      height: 2, width: 3, length: 10,
      m_fare: 5, c_fare: 10, b_fare: 25,
      m_revenue: 100, c_revenue: 150, b_revenue: 125)
  end

  it 'I can see a floor as a visitor' do
    visit root_path

    click_on 'Parking Visitor'

    visit structure_path(@structure_1)

    expect(page).to have_content(@structure_1.name)
    expect(page).to have_content("Number of Floors: #{@structure_1.height}")

    select '1', :from => "floor[id]"

    click_on 'View'

    expect(page).to have_content("Floor 1")
    expect(page).to have_content("Click a vehicle to remove it")
    expect(page).to have_content("M = Motorcycle, C = Compact, L = Large")
    expect(page).to have_content("Vehicle icons are occupied spaces")
    expect(page).to have_content('Select your vehicle to reserve a parking spot:')
    expect(page).to have_link('🏍')
    expect(page).to have_link('🚗')
    expect(page).to have_link('🚌')
  end

  it 'I can see a structure as an admin' do
    visit root_path

    click_on 'Parking Visitor'

    visit structure_path(@structure_1)

    expect(page).to have_content(@structure_1.name)
    expect(page).to have_content("Number of Floors: #{@structure_1.height}")

    select '1', :from => "floor[id]"

    click_on 'View'

    expect(page).to have_content("Floor 1")
  end
end
