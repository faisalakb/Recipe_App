require 'rails_helper' 

RSpec.describe FoodsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { User.find_or_create_by(email: 'test@example.com') }
  
  describe 'GET #index' do
    context 'when user is authenticated' do
      
      it 'renders the index template' do
        user = create(:user)
        sign_in user

        get :index
      
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to sign in' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #show' do
    context 'when params[:id] is a valid food id' do
      let(:food) { create(:food, user: user) } # Assuming a Food factory is set up

      it 'renders the show template' do
        sign_in user # Sign in the user

        get :show, params: { id: food.id }

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #new' do

    it 'renders the new template' do
        sign_in user # Sign in the user

        get :new
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end