require 'rails_helper'

RSpec.describe Admin::HackersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      sign_in FactoryGirl.create(:admin)
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
