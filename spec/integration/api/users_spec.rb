require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
    path '/api/v1/users' do
        get 'Retrieves all users' do
            tags 'Users'
            produces 'application/json', 'application/xml'

            response '200', 'users found' do
                schema type: :object,
                    properties: {
                        id: { type: :integer },
                        name: { type: :string },
                        photo: { type: :string },
                        bio: { type: :string },
                        created_at: { type: :string },
                        updated_at: { type: :string },
                        role: { type: :string },
                        posts_counter: { type: :integer },
                        email: { type: :string }
                    },
                    required: [ 'id', 'name', 'photo', 'bio', 'created_at', 'updated_at', 'role', 'posts_counter', 'email' ]

                run_test!
            end
        end
    end
end
