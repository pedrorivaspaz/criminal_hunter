class Api::WantedsController < ApplicationController
  before_action :set_wanted, only: %i[ show update destroy ]
  before_action :set_wanteds, only: %i[ index search ]
  before_action :authenticate_user!, only: %i[ create update destroy ]

# GET /wanteds
  def index
    @wanteds = Wanted.order(id: :asc).paginate(page: params[:page], per_page: 20)
    render json: @wanteds
  end

 
  def show
    if @wanted
      render json: @wanted, status: :ok
    else
      render json: { error: 'Registro não encontrado' }, status: :not_found
    end
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

  def search
    if params[:nome].present?
      @wanteds = Wanted.where("nome ilike ?", "%#{params[:nome]}%").order(:nome)
      render json: @wanteds
    else
      render json: { message: 'Nenhum resultado encontrado' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wanted
      @wanted = Wanted.find(params[:id])
    end

    def set_wanteds
      @wanteds = Wanted.all
    end

    # Only allow a list of trusted parameters through.
    def wanted_params
      params.require(:wanted).permit(:nome, :data_aniversario_usada, :cabelo, :olhos, :sexo, :peso, :altura, :raca, :nacionalidade, :crime, :url_foto, :origem)
    end
end
