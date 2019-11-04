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

    expect(page).to have_content('Row A: L L L L L M M C C Row B: L L L L L M M C C Row C: L L L L L M M C C')

    click_on '🏍'

    expect(@structure_1.reload.m_revenue).to eq(105)
    expect(page).to have_content('Row A: L L L L L 🏍 M C C Row B: L L L L L M M C C Row C: L L L L L M M C C')

    click_on '🏍'

    expect(@structure_1.reload.m_revenue).to eq(110)
    expect(page).to have_content('Row A: L L L L L 🏍 🏍 C C Row B: L L L L L M M C C Row C: L L L L L M M C C')

    click_on '🏍'

    expect(@structure_1.reload.m_revenue).to eq(115)
    expect(page).to have_content('Row A: L L L L L 🏍 🏍 C C Row B: L L L L L 🏍 M C C Row C: L L L L L M M C C')

    click_on '🏍'

    expect(@structure_1.reload.m_revenue).to eq(120)
    expect(page).to have_content('Row A: L L L L L 🏍 🏍 C C Row B: L L L L L 🏍 🏍 C C Row C: L L L L L M M C C')

    click_on '🏍'

    expect(@structure_1.reload.m_revenue).to eq(125)
    expect(page).to have_content('Row A: L L L L L 🏍 🏍 C C Row B: L L L L L 🏍 🏍 C C Row C: L L L L L 🏍 M C C')

    click_on '🏍'

    expect(@structure_1.reload.m_revenue).to eq(130)
    expect(page).to have_content('Row A: L L L L L 🏍 🏍 C C Row B: L L L L L 🏍 🏍 C C Row C: L L L L L 🏍 🏍 C C')

    click_on '🏍'

    expect(@structure_1.reload.m_revenue).to eq(135)
    expect(page).to have_content('Row A: L L L L L 🏍 🏍 🏍 C Row B: L L L L L 🏍 🏍 C C Row C: L L L L L 🏍 🏍 C C')
  end

  it 'I can park a car' do
    visit root_path
    click_on 'Parking Visitor'
    visit structure_path(@structure_1)
    select '1', :from => "floor[id]"
    click_on 'View'

    expect(page).to have_content('Row A: L L L L L M M C C Row B: L L L L L M M C C Row C: L L L L L M M C C')

    click_on '🚗'

    expect(@structure_1.reload.c_revenue).to eq(160)
    expect(page).to have_content('Row A: L L L L L M M 🚗 C Row B: L L L L L M M C C Row C: L L L L L M M C C')
  end

  it 'I can park a bus' do
    visit root_path
    click_on 'Parking Visitor'
    visit structure_path(@structure_1)
    select '1', :from => "floor[id]"
    click_on 'View'

    expect(page).to have_content('Row A: L L L L L M M C C Row B: L L L L L M M C C Row C: L L L L L M M C C')

    click_on '🚌'

    expect(@structure_1.reload.b_revenue).to eq(150)
    expect(page).to have_content('Row A: 🚌 🚌 🚌 🚌 🚌 M M C C Row B: L L L L L M M C C Row C: L L L L L M M C C')

    click_on '🚌'

    expect(@structure_1.reload.b_revenue).to eq(175)
    expect(page).to have_content('Row A: 🚌 🚌 🚌 🚌 🚌 M M C C Row B: 🚌 🚌 🚌 🚌 🚌 M M C C Row C: L L L L L M M C C')

    click_on '🚌'

    expect(@structure_1.reload.b_revenue).to eq(200)
    expect(page).to have_content('Row A: 🚌 🚌 🚌 🚌 🚌 M M C C Row B: 🚌 🚌 🚌 🚌 🚌 M M C C Row C: 🚌 🚌 🚌 🚌 🚌 M M C C')

    click_on '🚌'

    expect(@structure_1.reload.b_revenue).to eq(200)
    expect(page).to have_content('There is no more room for bus parking!')
    expect(page).to have_content('Row A: 🚌 🚌 🚌 🚌 🚌 M M C C Row B: 🚌 🚌 🚌 🚌 🚌 M M C C Row C: 🚌 🚌 🚌 🚌 🚌 M M C C')
  end
end
