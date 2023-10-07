# spec/requests/api/v1/comments_spec.rb

require 'swagger_helper'

describe 'Comments API' do
  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    parameter name: 'user_id', in: :path, type: :integer, required: true
    parameter name: 'post_id', in: :path, type: :integer, required: true

    get 'Retrieves comments for a specific post' do
      tags 'Comments'
      produces 'application/json'

      response '200', 'list of comments' do
        run_test!
      end
    end

    post 'Creates a new comment for a post' do
      tags 'Comments'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :comment, in: :body, schema: { '$ref' => '#/components/schemas/CommentInput' }

      response '201', 'comment created' do
        let(:comment) { { text: 'This is a new comment' } }
        run_test!
      end

      response '422', 'unprocessable_entity' do
        let(:comment) { { text: nil } }
        run_test!
      end
    end
  end
end
