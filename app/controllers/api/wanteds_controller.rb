module Api
  class WantedsController < ApplicationController
    include Pagy::Backend
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    
    before_action :authenticate, only: [:index, :create, :update, :destroy ]
    before_action :set_wanted, only: [:show, :update, :destroy]
    before_action :set_wanteds, only: [:index, :search]

    # GET /wanteds
    def index
      begin
        pagy, @wanteds = pagy(Wanted.order(:id), items: 20)
        render json: @wanteds
      rescue Pagy::OverflowError
        render json: { error: "A página procurada não existe." }, status: :not_found
      end
    end


    # GET /wanteds/1
    def show
      render json: @wanted
    end


    # POST /wanteds
    def create
      @wanted = Wanted.new(wanted_params)

      if @wanted.save
        render json: @wanted, status: :created, location: @wanted
      else
        render json: @wanted.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /wanteds/1
    def update
      if @wanted.update(wanted_params)
        render json: @wanted
      else
        render json: @wanted.errors, status: :unprocessable_entity
      end
    end

    # DELETE /wanteds/1
    def destroy
      @wanted.destroy
    end

    # GET /wanteds/search
  def search
    if params[:nome].present?
        @wanteds = Wanted.search_by_nome(params[:nome])
    else
      render json: { error: 'Nenhum registro encontrado' }, status: :not_found
    end

    render json: @wanteds
  end


    private
      def set_wanted
        @wanted = Wanted.find_by(id: params[:id])
        unless @wanted
          render json: { error: 'Registro não encontrado' }, status: :not_found
        end
      end

      def set_wanteds
        @wanteds = Wanted.all
      end

      def wanted_params
        params.require(:wanted).permit(:nome, :data_aniversario_usada, :cabelo, :olhos, :sexo, :peso, :altura, :raca, :nacionalidade, :crime, :url_foto, :origem)
      end

    def authenticate
      authenticate_or_request_with_http_basic do |user, password|
        user == "Criminal-Hunter" && password == "Wanteds"
      end
    end
  end
end
