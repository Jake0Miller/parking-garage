require 'rails_helper'

RSpec.describe 'Structures create' do
  before :each do
    @name = 'Building A'
    @height = 2
    @width = 3
    @length = 30
    @m_fare = 5.0
    @c_fare = 8.0
    @b_fare = 15.0
  end

  it 'I can create a structure as an admin' do
    expect(Structure.count).to eq(0)
    visit root_path

    click_on 'Parking Admin'

    within 'nav' do
      click_on 'Build'
    end

    expect(current_path).to eq(new_admin_structure_path)

    fill_in 'Name', with: @name
    select @height, :from => "structure[height]"
    select @width, :from => "structure[width]"
    select @length, :from => "structure[length]"

    click_on 'Create Structure'

    expect(Structure.count).to eq(1)
    expect(current_path).to eq(structures_path)
    expect(page).to have_content(@name)
    expect(Floor.count).to eq(@height)
    expect(Row.count).to eq(@height*@width)
    expect(Spot.count).to eq(@height*@width*9)
  end

  it 'I can create a structure with all fields an admin' do
    expect(Structure.count).to eq(0)
    visit root_path

    click_on 'Parking Admin'

    within 'nav' do
      click_on 'Build'
    end

    expect(current_path).to eq(new_admin_structure_path)

    fill_in 'Name', with: @name
    select @height, :from => "structure[height]"
    select @width, :from => "structure[width]"
    select @length, :from => "structure[length]"
    fill_in "structure[m_fare]", with: @m_fare
    fill_in "structure[c_fare]", with: @c_fare
    fill_in "structure[b_fare]", with: @b_fare

    click_on 'Create Structure'

    expect(Structure.count).to eq(1)
    expect(current_path).to eq(structures_path)
    expect(page).to have_content(@name)
    expect(Floor.count).to eq(@height)
  end

  it 'A visitor cannot create a structure' do
    visit new_admin_structure_path

    expect(current_path).to eq(root_path)

    click_on 'Parking Visitor'
    visit new_admin_structure_path

    expect(current_path).to eq(root_path)

    page.driver.submit :post, admin_structures_path(@ramen), {}

    expect(current_path).to eq(root_path)
    expect(Floor.count).to eq(0)
  end

  it 'I cannot create a structure with fields missing' do
    expect(Structure.count).to eq(0)
    visit root_path

    click_on 'Parking Admin'

    within 'nav' do
      click_on 'Build'
    end

    expect(current_path).to eq(new_admin_structure_path)

    select @height, :from => "structure[height]"
    select @width, :from => "structure[width]"
    select @length, :from => "structure[length]"
    fill_in "structure[m_fare]", with: @m_fare
    fill_in "structure[c_fare]", with: @c_fare
    fill_in "structure[b_fare]", with: @b_fare

    click_on 'Create Structure'

    expect(Structure.count).to eq(0)
    expect(current_path).to eq(new_admin_structure_path)
    expect(Floor.count).to eq(0)
  end
end
