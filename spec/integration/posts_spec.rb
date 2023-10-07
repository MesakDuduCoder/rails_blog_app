# spec/requests/api/v1/posts_spec.rb

require 'swagger_helper'

describe 'Posts API' do
  path '/api/v1/posts' do
    get 'Retrieves a list of posts' do
      tags 'Posts'
      produces 'application/json'

      response '200', 'list of posts' do
        run_test!
      end
    end
  end
end
