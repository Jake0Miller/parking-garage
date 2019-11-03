require 'rails_helper'

RSpec.describe 'Structures create' do
  before :each do
    @name = 'Building A'
    @height = 6
    @width = 2
    @length = 40
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
    select @height, :from => "structure[height]"
    select @width, :from => "structure[width]"
    select @length, :from => "structure[length]"

    expect(Structure.count).to eq(1)
    expect(current_path).to eq(structures_path)
    expect(page).to have_content(@name)
  end
end
