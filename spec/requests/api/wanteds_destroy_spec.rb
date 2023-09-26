require 'swagger_helper'

# to update api-doc: bundle exec rake rswag:specs:swaggerize
RSpec.describe 'api/wanteds/{id}', type: :request do

 
  path 'api/wanteds/{id}' do
    delete('Deleta procurados do sistema') do
      tags 'Wanted'
      consumes 'application/json'
      produces 'application/json'
 
      parameter name: :id,
                in: :path,
                type: :integer,
                description: 'Parâmetro ID ',
                required: true

        response 204, 'deleted' do
        let(:wanteds) { create_list(:wanted) }
        let(:id) { wanteds.first.id } # Usando o ID do primeiro registro criado anteriormente

        run_test!
      end

      response '404', 'not found' do
        let(:id) { 'non_existent_id' } # Um ID que não existe

        run_test!
      end

      response '422', 'unprocessable entity' do
        let(:id) { 999 } # Um ID válido, mas que pode causar erro

        run_test!
      end
    end
  end
end
