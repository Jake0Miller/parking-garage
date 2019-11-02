require 'rails_helper'

RSpec.describe 'Sessions Controller' do
  it 'I can log in as a visitor' do
    visit root_path
    expect(page).to have_content('Login')
    expect(page).to_not have_content('Logout')
    expect(page).to_not have_content('Browse')
    expect(page).to_not have_content('Build')

    click_on 'Parking Visitor'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Please view our available resources:')

    within 'nav' do
      expect(page).to have_content('Logout')
      expect(page).to have_content('Browse')
      expect(page).to_not have_content('Login')
      expect(page).to_not have_content('Build')

      click_on 'Logout'

      expect(page).to_not have_content('Logout')
      expect(page).to have_content('Login')
    end
  end

  it 'I can log in as an admin' do
    visit root_path
    expect(page).to have_content('Login')
    expect(page).to_not have_content('Logout')
    expect(page).to_not have_content('Browse')
    expect(page).to_not have_content('Build')

    click_on 'Parking Admin'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Please view our available resources:')
    
    within 'nav' do
      expect(page).to have_content('Logout')
      expect(page).to have_content('Browse')
      expect(page).to have_content('Build')
      expect(page).to_not have_content('Login')

      click_on 'Logout'

      expect(page).to_not have_content('Logout')
      expect(page).to have_content('Login')
    end
  end
end
