require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do

    it "successful status" do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
      
    end

    it "rendering a correct template" do
      get '/users/1/posts'
      expect(response).to render_template(:index)
      
    end
    it 'Corrent placeholder in body' do
      get '/users/1/posts'
      expect(response.body).to include('All posts for individual author are here')
    end
   end



  describe 'GET /index ' do

    it "users status" do
      get '/users/1/posts/1'
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
    end

    it 'Corrent placeholder in body' do
      get '/users/1/posts/1'
      expect(response.body).to include('individual post is here')
    end
end
end
