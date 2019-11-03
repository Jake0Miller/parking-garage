require 'rails_helper'

RSpec.describe 'Structures create' do
  before :each do
    @name = 'Building A'
    @height = 6
    @width = 2
    @length = 100
  end

  it 'I can create a structure as an admin' do
    expect(Structure.count).to eq(0)
    visit root_path

    click_on 'Parking Admin'

    within 'nav' do
      click_on 'Build'
    end

    expect(current_path).to eq(new_structure_path)

    fill_in 'Name', with: @name
    fill_in 'Height', with: @height
    fill_in 'Width', with: @width
    fill_in 'Length', with: @length

    expect(Structure.count).to eq(0)
    expect(current_path).to eq(structures_path)
    expect(page).to have_content(@name)
  end
end
