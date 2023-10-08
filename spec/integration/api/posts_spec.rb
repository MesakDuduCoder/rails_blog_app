require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do
   path '/api/v1/users/{user_id}/posts' do
         get 'Retrieves all posts' do
              tags 'Posts'
              produces 'application/json', 'application/xml'
    
              response '200', 'posts found' do
                schema type: :object,
                     properties: {
                          id: { type: :integer },
                          title: { type: :string },
                          text: { type: :string },
                          created_at: { type: :string },
                          updated_at: { type: :string },
                          comments_counter: { type: :integer },
                          likes_counter: { type: :integer },
                          author_id: { type: :integer }
                     },
                     required: [ 'id', 'title', 'text', 'created_at', 'updated_at', 'comments_counter', 'likes_counter', 'author_id' ]
    
                run_test!
              end
         end
    end 
end
