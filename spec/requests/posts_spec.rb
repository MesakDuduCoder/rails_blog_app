require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET #index' do
    let(:user) { create(:user) }
    it 'returns a successful response' do
      get user_posts_path(user)
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get user_posts_path(user)
      expect(response.body).to include('Posts')
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }
    let(:post) { create(:post, author: user) }

    it 'returns a successful response' do
      get user_post_path(user, post)
      expect(response).to have_http_status(:ok)
    end

    it 'renders the show template' do
      get user_post_path(user, post)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get user_post_path(user, post)
      expect(response.body).to include('Post')
    end
  end
end
