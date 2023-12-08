require 'rails_helper'

RSpec.feature 'Foods', type: :feature do
  scenario 'User views list of foods' do
    # Create sample foods using FactoryBot
    food1 = FactoryBot.create(:food, name: 'Sample Food 1', measurement_unit: 'kg', price: 20, quantity: 3)
    food2 = FactoryBot.create(:food, name: 'Sample Food 2', measurement_unit: 'g', price: 10, quantity: 5)

    # Visit the foods index page
    visit foods_path

    # Verify that the list of foods is displayed
    expect(page).to have_content('List of Foods')
    expect(page).to have_content(food1.name)
    expect(page).to have_content('kg')
    expect(page).to have_content('$20.00')
    expect(page).to have_content('3')
    expect(page).to have_content(food2.name)
    expect(page).to have_content('g')
    expect(page).to have_content('$10.00')
    expect(page).to have_content('5')

    # Verify the "Add Food" button and its functionality
    expect(page).to have_content('Add Food')
    click_link 'Add Food'

    # Fill in the form and submit
    fill_in 'Name', with: 'New Food'
    fill_in 'Measurement Unit', with: 'pcs'
    fill_in 'Price', with: '15'
    fill_in 'Quantity', with: '10'
    click_button 'Add Food'

    # Verify that the newly added food is displayed
    expect(page).to have_content('Food was successfully created.')
    expect(page).to have_content('New Food')
    expect(page).to have_content('pcs')
    expect(page).to have_content('$15.00')
    expect(page).to have_content('10')

    # Verify deletion functionality (assuming there are two foods)
    expect(page).to have_link('Delete', count: 2) # Ensure there are delete links
    first(:link, 'Delete').click # Click the first delete link

    # Handle the confirmation dialog
    page.driver.browser.switch_to.alert.accept

    # Verify deletion success message
    expect(page).to have_content('Food was successfully deleted.')
    expect(page).not_to have_content(food1.name) # Ensure the deleted food is not shown
  end
end
