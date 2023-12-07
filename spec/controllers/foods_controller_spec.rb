require 'rails_helper' 

RSpec.describe FoodsController, type: :controller do
  include Devise::Test::ControllerHelpers

  # before do
  #   allow(controller).to receive(:authenticate_user!).and_return(true)
  # end

  let(:user) { User.find_or_create_by(email: 'test@example.com') }
  
  describe 'GET #index' do
    context 'when user is authenticated' do
      it 'assigns @foods with current_user foods' do
        user = create(:user) # Create the user
        sign_in user # Sign in the user

        get :index

        expect(assigns(:foods)).to match_array(user.foods)
      end

      it 'renders the index template' do
        user = create(:user) # Create the user
        sign_in user # Sign in the user

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

      it 'assigns @food with the correct food' do
        sign_in user # Sign in the user

        get :show, params: { id: food.id }

        expect(assigns(:food)).to eq(food)
      end

      it 'renders the show template' do
        sign_in user # Sign in the user

        get :show, params: { id: food.id }

        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when params[:id] is missing_foods' do
      it 'calls missing_foods method' do
        sign_in user # Sign in the user

        expect(controller).to receive(:missing_foods).and_call_original

        get :show, params: { id: 'missing_foods' }
      end
    end
  end

  describe 'GET #new' do
    it 'assigns a new Food to @food' do
      sign_in user # Sign in the user

        get :new

      expect(assigns(:food)).to be_a_new(Food)
    end

    it 'renders the new template' do
        sign_in user # Sign in the user

        get :new
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
