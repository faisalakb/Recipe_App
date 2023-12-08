# spec/features/foods_spec.rb

require 'rails_helper'

RSpec.feature 'Foods', type: :feature do
  let(:user) { create(:user) } # Assuming you have a factory set up for User

  before do
    sign_in user
  end

  scenario 'User views list of foods' do
    food1 = create(:food, user: user, name: 'Apple', measurement_unit: 'Piece', price: 1.99, quantity: 5)
    food2 = create(:food, user: user, name: 'Banana', measurement_unit: 'Piece', price: 2.49, quantity: 3)

    visit foods_path

    expect(page).to have_content('List of Foods')
    expect(page).to have_content('Add Food')

    expect(page).to have_content('Apple')
    expect(page).to have_content('Piece')
    expect(page).to have_content('$1.99')
    expect(page).to have_content('5')

    expect(page).to have_content('Banana')
    expect(page).to have_content('Piece')
    expect(page).to have_content('$2.49')
    expect(page).to have_content('3')
  end

  scenario 'User adds a new food' do
    visit foods_path

    click_link 'Add Food'

    fill_in 'food_name', with: 'Orange'
    fill_in 'food_measurement_unit', with: 'Piece'
    fill_in 'food_price', with: '2.00'
    fill_in 'food_quantity', with: '4'

    click_button 'Add Food'

    expect(page).to have_content('List of Foods')
    expect(page).to have_content('Orange')
    expect(page).to have_content('Piece')
    expect(page).to have_content('$2.00')
    expect(page).to have_content('4')
  end

  scenario 'User deletes a food' do
    food = create(:food, user: user, name: 'Pear', measurement_unit: 'Piece', price: 1.50, quantity: 2)

    visit foods_path

    expect(page).to have_content('Pear')

    accept_confirm { click_link 'Delete' }

    expect(page).to_not have_content('Pear')
  end
end
