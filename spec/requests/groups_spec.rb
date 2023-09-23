require 'rails_helper'

RSpec.describe "Groups", type: :request do
  include Devise::Test::IntegrationHelpers

  describe "GET /groups" do
    context "when a user is signed in" do
      before do
        @user = FactoryBot.create(:user)
        sign_in @user
      end

      it 'responds with a 200 OK status code' do
        get groups_path
        expect(response).to have_http_status(:ok)
      end

      it 'assigns @groups with the user\'s groups' do
        FactoryBot.create_list(:group, 3, user: @user)
        
        get groups_path
        expect(assigns(:groups)).to eq(@user.groups)
      end
    end

    context "when no user is signed in" do
      it 'responds with a 302 Found status code (redirects to sign-in)' do
        get groups_path
        expect(response).to have_http_status(:found) # 302 Found
      end
    end
  end
end
