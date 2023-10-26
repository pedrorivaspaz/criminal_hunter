require 'swagger_helper'

# to update api-doc: bundle exec rake rswag:specs:swaggerize
RSpec.describe '/api/wanteds', type: :request do

 
  path '/api/wanteds' do
    post('Cria procurados no sistema') do
      tags 'Procurados'
      consumes 'application/json'
      produces 'application/json'
      security [basic_auth: []]
      parameter name: :Authorization, 
                in: :header, 
                type: :string,
                description: 'Token de autenticação padrão Basic Authentication composto por username e password',
                required: true

      parameter name: :wanted,
        in: :body,
        schema: {
          type: :object,
          properties: {
            nome: {
              type: :string,
              example: 'Alexsandro Perreira da Silva',
              description: 'Nome dos procurados'
            },
            data_aniversario_usada: {
              type: :string,
              example: '12/09/2001',
              description: 'Data de aniversário que o procurado usou'
            },
            cabelo: {
              type: :string,
              example: 'Black',
              description: 'Cor do cabelo'
            },
            olhos: {
              type: :string,
              example: 'Brown',
              description: 'Cor dos olhos'
            },
            sexo: {
              type: :string,
              example: 'Male',
              description: 'Gênero do procurado'
            },
            peso: {
              type: :string,
              example: '87 kg',
              description: 'Peso do procurado'
            },
            altura: {
              type: :string,
              example: '1.72 cm',
              description: 'Altura do procurado'
            },
            raca: {
              type: :string,
              example: 'Asian',
              description: 'Etnia do procurado'
            },
            nacionalidade: {
              type: :string,
              example: 'Brazilian',
              description: 'Nascionalidade do procurado'
            },
            crime: {
              type: :string,
              example: 'Morder',
              description: 'Crime cometido pelo procurado'
            },
            url_foto: {
              type: :string,
              example: 'https://ws-public.interpol.int/notices/v1/red/2023-61947/images',
              description: 'Url da foto do procurado'
            },
            origem: {
              type: :string,
              example: 'FBI',
              description: 'Lugar de extração do dado'
            }
          }
        }
        
      response 201, 'successful' do
        let(:wanteds) { FactoryBoy.attributes_for(:wanted) }
        let(:id) {wanted.id}
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end