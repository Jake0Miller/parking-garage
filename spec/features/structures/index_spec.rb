require 'rails_helper'

RSpec.describe 'Structures index' do
  before :each do
    @structure_1 = Structure.create!(name: 'Building A',
      height: 2, width: 3, length: 10,
      m_fare: 5, c_fare: 10, b_fare: 25,
      m_revenue: 0, c_revenue: 0, b_revenue: 0)
    @structure_2 = Structure.create!(name: 'Building B',
      height: 2, width: 3, length: 10,
      m_fare: 5, c_fare: 10, b_fare: 25,
      m_revenue: 0, c_revenue: 0, b_revenue: 0)
    @structure_3 = Structure.create!(name: 'Building C',
      height: 2, width: 3, length: 10,
      m_fare: 5, c_fare: 10, b_fare: 25,
      m_revenue: 0, c_revenue: 0, b_revenue: 0)
  end

  it 'I can see all structures as a visitor' do
    visit root_path

    click_on 'Parking Visitor'

    expect(current_path).to eq(root_path)

    within 'nav' do
      click_on 'Browse'
    end

    expect(current_path).to eq(structures_path)
    expect(page).to have_css('.building', count: 3)

    within ".building-#{@structure_1.id}" do
      expect(page).to have_content(@structure_1.name)
      expect(page).to have_link(@structure_1.name)
    end
  end

  it 'I can see all structures as an admin' do
    visit root_path

    click_on 'Parking Admin'

    expect(current_path).to eq(root_path)

    within 'nav' do
      click_on 'Browse'
    end

    expect(current_path).to eq(structures_path)
    expect(page).to have_css('.building', count: 3)

    within ".building-#{@structure_1.id}" do
      expect(page).to have_content(@structure_1.name)
      expect(page).to have_link(@structure_1.name)
    end
  end
end
