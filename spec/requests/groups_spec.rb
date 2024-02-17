require 'rails_helper'

# spec/rails_helper.rb
RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include FactoryBot::Syntax::Methods
end


RSpec.describe GroupsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end
  describe 'GET /new' do
    it 'assigns a new @group' do
      get :new
      expect(assigns(:group)).to be_a_new(Group)
    end
  end
end
