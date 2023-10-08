require 'swagger_helper'

RSpec.describe 'api/comments', type: :request do
    path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
        get 'Retrieves all comments' do
            tags 'Comments'
            produces 'application/json', 'application/xml'

            response '200', 'comments found' do
                schema type: :object,
                    properties: {
                        id: { type: :integer },
                        text: { type: :string },
                        created_at: { type: :string },
                        updated_at: { type: :string },
                        user_id: { type: :integer },
                        post_id: { type: :integer }
                    },
                    required: [ 'id', 'text', 'created_at', 'updated_at', 'user_id', 'post_id' ]

                run_test!
            end
        end
    end

    path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
        post 'Creates a comment' do
            tags 'Comments'
            consumes 'application/json', 'application/xml'
            parameter name: :comment, in: :body, schema: {
                type: :object,
                properties: {
                    text: { type: :string }
                },
                required: [ 'text' ]
            }

            response '201', 'comment created' do
                let(:comment) { { text: 'example comment' } }
                run_test!
            end

            response '422', 'invalid request' do
                let(:comment) { { text: '' } }
                run_test!
            end
        end
    end
end
