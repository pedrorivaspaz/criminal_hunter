require 'swagger_helper'

# to update api-doc: bundle exec rake rswag:specs:swaggerize
RSpec.describe 'api/wanteds/{id}', type: :request do

 
  path 'api/wanteds/{id}' do
    put('Atualiza procurados do sistema') do
      tags 'Wanted'
      consumes 'application/json'
      produces 'application/json'
 
      parameter name: :id,
                in: :path,
                type: :integer,
                description: 'Parâmetro ID para filtrar procurados',
                required: true 

      

      response 200, 'successful' do
        let(:wanteds) { create_list(:wanted) }
        let(:id) {wanted.id}
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        schema type: :object,
          properties: {
            id: {
              type: :integer,
              description: 'ID unico incremental do registro na tabela',
              nullable: false
            },
            nome: {
              type: :string,
              description: 'Nome do procurado',
              nullable: false
            },
            data_aniversario_usada: {
              type: :string,
              description: 'Data de aniversário que o procurado usou',
            },
            cabelo: {
              type: :string,
              description: 'Cor do cabelo do procurado'
            },
            olhos: {
              type: :string,
              description: 'Cor dos olhos do procurado'
            },
            sexo: {
              type: :string,
              description: 'Gênero do procurado'
            },
            peso: {
              type: :integer,
              description: 'Peso do procurado',
              nullable: false
            },
            altura: {
              type: :string,
              description: 'Altura do procurado',
              nullable: false
            },
            raca: {
              type: :string,
              description: 'Etnia do procurado'
            },
            nacionalidade: {
              type: :string,
              description: 'Nascionalidade do procurado'
            },
            crime: {
              type: :string,
              description: 'Crime cometido pelo procurado'
            },
            url_foto: {
              type: :string,
              description: 'Url da foto do procurado'
            },
            origem: {
              type: :string,
              description: 'De qual lugar o dado foi buscado'
            },
            created_at: {
              type: :string,
              description: 'Data de criação do registro no banco de dados'
            },
            updated_at: {
              type: :string,
              description: 'Data de ultima atualização do registro no banco de dados'
            }
          }
        run_test!
      end
    end
  end
end

 