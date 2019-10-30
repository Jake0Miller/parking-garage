require 'rails_helper'

RSpec.describe 'Index Page' do
  it 'I see the welcome page' do
    visit root_path

    expect(page).to have_content('Welcome to Parking Garage')
    expect(page).to have_content('Please log in by selecting a role:')
  end

  it 'I see a link to homepage' do
    visit '/'

    within 'nav' do
      click_link 'ParkingGarage'
    end

    expect(current_path).to eq(root_path)

    within 'nav' do
      click_link 'Login'
    end

    expect(current_path).to eq(root_path)
  end

  it 'I see a 404 visiting undefined paths' do
    visit '/apple'

    expect(page.status_code).to eq(404)
  end
end
