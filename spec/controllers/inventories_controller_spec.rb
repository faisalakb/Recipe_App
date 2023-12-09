require 'rails_helper'

class InventoriesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventories)
  end

  test 'should show inventory' do
    inventory = create(:inventory)
    get :show, params: { id: inventory.id }
    assert_response :success
    assert_not_nil assigns(:inventory)
  end

  test 'should get new' do
    sign_in create(:user)
    get :new
    assert_response :success
    assert_not_nil assigns(:inventory)
  end

  test 'should create inventory' do
    user = create(:user)
    sign_in user

    assert_difference('Inventory.count') do
      post :create, params: { inventory: { name: 'New Inventory', description: 'Test Description' } }
    end

    assert_redirected_to inventories_path(user)
    assert_equal 'Inventory was successfully created.', flash[:notice]
  end

  test 'should get edit' do
    inventory = create(:inventory)
    sign_in inventory.user

    get :edit, params: { id: inventory.id }
    assert_response :success
    assert_not_nil assigns(:inventory)
  end

  test 'should update inventory' do
    inventory = create(:inventory)
    sign_in inventory.user

    patch :update, params: { id: inventory.id, inventory: { name: 'Updated Inventory' } }
    assert_redirected_to inventory_path(inventory)
    assert_equal 'Inventory was successfully updated.', flash[:notice]

    inventory.reload
    assert_equal 'Updated Inventory', inventory.name
  end

  test 'should destroy inventory' do
    inventory = create(:inventory)
    sign_in inventory.user

    assert_difference('Inventory.count', -1) do
      delete :destroy, params: { id: inventory.id }
    end

    assert_redirected_to inventories_path
    assert_equal 'Inventory was successfully destroyed.', flash[:notice]
  end

  test 'should not destroy inventory with invalid user' do
    inventory = create(:inventory)
    sign_in create(:user) # Different user

    delete :destroy, params: { id: inventory.id }
    assert_redirected_to root_path
    assert_equal 'You do not have permission to delete this item.', flash[:alert]
  end
end
