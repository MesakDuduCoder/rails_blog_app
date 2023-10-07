# spec/requests/api/v1/users_spec.rb

require 'swagger_helper'

describe 'Users API' do
  path '/api/v1/users' do
    get 'Retrieves a list of users' do
      tags 'Users'
      produces 'application/json'

      response '200', 'list of users' do
        run_test!
      end
    end
  end
end
