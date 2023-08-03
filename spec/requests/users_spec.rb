require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'successful status' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end

    it 'rendering a correct template' do
      get '/users'
      expect(response).to render_template(:index)
    end
    it 'Corrent placeholder in body' do
      get '/users'
      expect(response.body).to include('Lists of user')
    end
  end

  describe 'GET /show' do
    it 'users status' do
      get '/users/1'
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get '/users/1'
      expect(response).to render_template(:show)
    end

    it 'Corrent placeholder in body' do
      get '/users/1'
      expect(response.body).to include('Here is individual user')
    end
  end
end
