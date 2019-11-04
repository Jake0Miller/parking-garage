require 'rails_helper'

RSpec.describe 'Park vehicles' do
  before :each do
    @structure_1 = Structure.create!(name: 'Building A',
      height: 1, width: 3, length: 30,
      m_fare: 5, c_fare: 10, b_fare: 25,
      m_revenue: 100, c_revenue: 150, b_revenue: 125)
  end

  it 'I can park a motorcycle' do
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

    within '.add' do
      click_on '🏍'
    end

    expect(@structure_1.reload.m_revenue).to eq(110)
    expect(page).to have_content("Row A:\nL\nL\nL\nL\nL\n🏍\n🏍\nC\nC\nRow B:\nL\nL\nL\nL\nL\nM\nM\nC\nC\nRow C:\nL\nL\nL\nL\nL\nM\nM\nC\nC")

    within '.add' do
      click_on '🏍'
    end

    expect(@structure_1.reload.m_revenue).to eq(115)
    expect(page).to have_content("Row A:\nL\nL\nL\nL\nL\n🏍\n🏍\nC\nC\nRow B:\nL\nL\nL\nL\nL\n🏍\nM\nC\nC\nRow C:\nL\nL\nL\nL\nL\nM\nM\nC\nC")

    within '.add' do
      click_on '🏍'
    end

    expect(@structure_1.reload.m_revenue).to eq(120)
    expect(page).to have_content("Row A:\nL\nL\nL\nL\nL\n🏍\n🏍\nC\nC\nRow B:\nL\nL\nL\nL\nL\n🏍\n🏍\nC\nC\nRow C:\nL\nL\nL\nL\nL\nM\nM\nC\nC")

    within '.add' do
      click_on '🏍'
    end

    expect(@structure_1.reload.m_revenue).to eq(125)
    expect(page).to have_content("Row A:\nL\nL\nL\nL\nL\n🏍\n🏍\nC\nC\nRow B:\nL\nL\nL\nL\nL\n🏍\n🏍\nC\nC\nRow C:\nL\nL\nL\nL\nL\n🏍\nM\nC\nC")

    within '.add' do
      click_on '🏍'
    end

    expect(@structure_1.reload.m_revenue).to eq(130)
    expect(page).to have_content("Row A:\nL\nL\nL\nL\nL\n🏍\n🏍\nC\nC\nRow B:\nL\nL\nL\nL\nL\n🏍\n🏍\nC\nC\nRow C:\nL\nL\nL\nL\nL\n🏍\n🏍\nC\nC")

    within '.add' do
      click_on '🏍'
    end

    expect(@structure_1.reload.m_revenue).to eq(135)
    expect(page).to have_content("Row A:\nL\nL\nL\nL\nL\n🏍\n🏍\n🏍\nC\nRow B:\nL\nL\nL\nL\nL\n🏍\n🏍\nC\nC\nRow C:\nL\nL\nL\nL\nL\n🏍\n🏍\nC\nC")

    within '.add' do
      5.times do |_|
        click_on '🏍'
      end
    end

    expect(@structure_1.reload.m_revenue).to eq(160)
    expect(page).to have_content("Row A:\nL\nL\nL\nL\nL\n🏍\n🏍\n🏍\n🏍\nRow B:\nL\nL\nL\nL\nL\n🏍\n🏍\n🏍\n🏍\nRow C:\nL\nL\nL\nL\nL\n🏍\n🏍\n🏍\n🏍")

    within '.add' do
      15.times do |_|
        click_on '🏍'
      end
    end

    expect(@structure_1.reload.m_revenue).to eq(235)
    expect(page).to have_content("Row A:\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\nRow B:\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\nRow C:\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍")

    within '.add' do
      click_on '🏍'
    end

    expect(@structure_1.reload.m_revenue).to eq(235)
    expect(page).to have_content('There is no more room for motorcycle parking!')
    expect(page).to have_content("Row A:\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\nRow B:\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\nRow C:\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍\n🏍")
  end

  it 'I can park a car' do
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

    within '.add' do
      click_on '🚗'
    end

    expect(@structure_1.reload.c_revenue).to eq(170)
    expect(page).to have_content("Row A:\nL\nL\nL\nL\nL\nM\nM\n🚗\n🚗\nRow B:\nL\nL\nL\nL\nL\nM\nM\nC\nC\nRow C:\nL\nL\nL\nL\nL\nM\nM\nC\nC")

    within '.add' do
      click_on '🚗'
    end

    expect(@structure_1.reload.c_revenue).to eq(180)
    expect(page).to have_content("Row A:\nL\nL\nL\nL\nL\nM\nM\n🚗\n🚗\nRow B:\nL\nL\nL\nL\nL\nM\nM\n🚗\nC\nRow C:\nL\nL\nL\nL\nL\nM\nM\nC\nC")

    within '.add' do
      click_on '🚗'
    end

    expect(@structure_1.reload.c_revenue).to eq(190)
    expect(page).to have_content("Row A:\nL\nL\nL\nL\nL\nM\nM\n🚗\n🚗\nRow B:\nL\nL\nL\nL\nL\nM\nM\n🚗\n🚗\nRow C:\nL\nL\nL\nL\nL\nM\nM\nC\nC")

    within '.add' do
      click_on '🚗'
    end

    expect(@structure_1.reload.c_revenue).to eq(200)
    expect(page).to have_content("Row A:\nL\nL\nL\nL\nL\nM\nM\n🚗\n🚗\nRow B:\nL\nL\nL\nL\nL\nM\nM\n🚗\n🚗\nRow C:\nL\nL\nL\nL\nL\nM\nM\n🚗\nC")

    within '.add' do
      click_on '🚗'
    end

    expect(@structure_1.reload.c_revenue).to eq(210)
    expect(page).to have_content("Row A:\nL\nL\nL\nL\nL\nM\nM\n🚗\n🚗\nRow B:\nL\nL\nL\nL\nL\nM\nM\n🚗\n🚗\nRow C:\nL\nL\nL\nL\nL\nM\nM\n🚗\n🚗")

    within '.add' do
      click_on '🚗'
    end

    expect(@structure_1.reload.c_revenue).to eq(220)
    expect(page).to have_content("Row A:\n🚗\nL\nL\nL\nL\nM\nM\n🚗\n🚗\nRow B:\nL\nL\nL\nL\nL\nM\nM\n🚗\n🚗\nRow C:\nL\nL\nL\nL\nL\nM\nM\n🚗\n🚗")

    within '.add' do
      14.times do |_|
        click_on '🚗'
      end
    end

    expect(@structure_1.reload.c_revenue).to eq(360)
    expect(page).to have_content("Row A:\n🚗\n🚗\n🚗\n🚗\n🚗\nM\nM\n🚗\n🚗\nRow B:\n🚗\n🚗\n🚗\n🚗\n🚗\nM\nM\n🚗\n🚗\nRow C:\n🚗\n🚗\n🚗\n🚗\n🚗\nM\nM\n🚗\n🚗")

    within '.add' do
      click_on '🚗'
    end

    expect(@structure_1.reload.c_revenue).to eq(360)
    expect(page).to have_content('There is no more room for car parking!')
    expect(page).to have_content("Row A:\n🚗\n🚗\n🚗\n🚗\n🚗\nM\nM\n🚗\n🚗\nRow B:\n🚗\n🚗\n🚗\n🚗\n🚗\nM\nM\n🚗\n🚗\nRow C:\n🚗\n🚗\n🚗\n🚗\n🚗\nM\nM\n🚗\n🚗")
  end

  it 'I can park a bus' do
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

    within '.add' do
      click_on '🚌'
    end

    expect(@structure_1.reload.b_revenue).to eq(175)
    expect(page).to have_content("Row A:\n🚌\n🚌\n🚌\n🚌\n🚌\nM\nM\nC\nC\nRow B:\n🚌\n🚌\n🚌\n🚌\n🚌\nM\nM\nC\nC\nRow C:\nL\nL\nL\nL\nL\nM\nM\nC\nC")

    within '.add' do
      click_on '🚌'
    end

    expect(@structure_1.reload.b_revenue).to eq(200)
    expect(page).to have_content("Row A:\n🚌\n🚌\n🚌\n🚌\n🚌\nM\nM\nC\nC\nRow B:\n🚌\n🚌\n🚌\n🚌\n🚌\nM\nM\nC\nC\nRow C:\n🚌\n🚌\n🚌\n🚌\n🚌\nM\nM\nC\nC")

    within '.add' do
      click_on '🚌'
    end

    expect(@structure_1.reload.b_revenue).to eq(200)
    expect(page).to have_content('There is no more room for bus parking!')
    expect(page).to have_content("Row A:\n🚌\n🚌\n🚌\n🚌\n🚌\nM\nM\nC\nC\nRow B:\n🚌\n🚌\n🚌\n🚌\n🚌\nM\nM\nC\nC\nRow C:\n🚌\n🚌\n🚌\n🚌\n🚌\nM\nM\nC\nC")
  end
end
