require 'rails_helper'

RSpec.describe 'Park vehicles' do
  before :each do
    @structure_1 = Structure.create!(name: 'Building A',
      height: 1, width: 1, length: 30,
      m_fare: 5, c_fare: 10, b_fare: 25,
      m_revenue: 100, c_revenue: 150, b_revenue: 125)
  end

  it 'I can park and remove a motorcycle' do
    visit root_path
    click_on 'Parking Visitor'
    visit structure_path(@structure_1)
    select '1', :from => "floor[id]"
    click_on 'View'

    expect(page).to have_content("Row A: L L L L L M M C C")

    within '.add' do
      click_on '🏍'
    end

    expect(@structure_1.reload.m_revenue).to eq(105)
    expect(page).to have_content("Row A: L L L L L 🏍 M C C")

    first('.spot').click

    expect(page).to have_content("Row A: L L L L L M M C C")
  end

  it 'I can park and remove a car' do
    visit root_path
    click_on 'Parking Visitor'
    visit structure_path(@structure_1)
    select '1', :from => "floor[id]"
    click_on 'View'

    expect(page).to have_content("Row A: L L L L L M M C C")

    within '.add' do
      click_on '🚗'
    end

    expect(@structure_1.reload.c_revenue).to eq(160)
    expect(page).to have_content("Row A: L L L L L M M 🚗 C")

    first('.spot').click

    expect(page).to have_content("Row A: L L L L L M M C C")
  end

  it 'I can park and remove a bus' do
    visit root_path
    click_on 'Parking Visitor'
    visit structure_path(@structure_1)
    select '1', :from => "floor[id]"
    click_on 'View'

    expect(page).to have_content("Row A: L L L L L M M C C")

    within '.add' do
      click_on '🚌'
    end

    expect(@structure_1.reload.b_revenue).to eq(150)
    expect(page).to have_content("Row A: 🚌 🚌 🚌 🚌 🚌 M M C C")

    first('.spot').click

    expect(page).to have_content("Row A: L L L L L M M C C")
  end
end
