require 'rails_helper'

RSpec.describe 'Park vehicles' do
  before :each do
    @structure_1 = Structure.create!(name: 'Building A',
      height: 1, width: 3, length: 30,
      m_fare: 5, c_fare: 10, b_fare: 25,
      m_revenue: 100, c_revenue: 150, b_revenue: 125)
  end

  it 'I can park and remove a motorcycle' do
    visit root_path
    click_on 'Parking Visitor'
    visit structure_path(@structure_1)
    select '1', :from => "floor[id]"
    click_on 'View'

    expect(page).to have_content("Row A:\nL\nL\nL\nL\nL\nM\nM\nC\nC\nRow B:\nL\nL\nL\nL\nL\nM\nM\nC\nC\nRow C:\nL\nL\nL\nL\nL\nM\nM\nC\nC")

    within '.add' do
      click_on '🏍'
    end

    expect(@structure_1.reload.m_revenue).to eq(105)
    expect(page).to have_content("Row A:\nL\nL\nL\nL\nL\n🏍\nM\nC\nC\nRow B:\nL\nL\nL\nL\nL\nM\nM\nC\nC\nRow C:\nL\nL\nL\nL\nL\nM\nM\nC\nC")

    # first('.spot > a').click
  end

  it 'I can park and remove a car' do
    visit root_path
    click_on 'Parking Visitor'
    visit structure_path(@structure_1)
    select '1', :from => "floor[id]"
    click_on 'View'

    expect(page).to have_content("Row A:\nL\nL\nL\nL\nL\nM\nM\nC\nC\nRow B:\nL\nL\nL\nL\nL\nM\nM\nC\nC\nRow C:\nL\nL\nL\nL\nL\nM\nM\nC\nC")

    within '.add' do
      click_on '🚗'
    end

    expect(@structure_1.reload.c_revenue).to eq(160)
    expect(page).to have_content("Row A:\nL\nL\nL\nL\nL\nM\nM\n🚗\nC\nRow B:\nL\nL\nL\nL\nL\nM\nM\nC\nC\nRow C:\nL\nL\nL\nL\nL\nM\nM\nC\nC")
  end

  it 'I can park and remove a bus' do
    visit root_path
    click_on 'Parking Visitor'
    visit structure_path(@structure_1)
    select '1', :from => "floor[id]"
    click_on 'View'

    expect(page).to have_content("Row A:\nL\nL\nL\nL\nL\nM\nM\nC\nC\nRow B:\nL\nL\nL\nL\nL\nM\nM\nC\nC\nRow C:\nL\nL\nL\nL\nL\nM\nM\nC\nC")

    within '.add' do
      click_on '🚌'
    end

    expect(@structure_1.reload.b_revenue).to eq(150)
    expect(page).to have_content("Row A:\n🚌\n🚌\n🚌\n🚌\n🚌\nM\nM\nC\nC\nRow B:\nL\nL\nL\nL\nL\nM\nM\nC\nC\nRow C:\nL\nL\nL\nL\nL\nM\nM\nC\nC")
  end
end
