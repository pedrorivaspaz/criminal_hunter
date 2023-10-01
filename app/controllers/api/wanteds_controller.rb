class Api::WantedsController < ApplicationController
  before_action :set_wanted, only: %i[ show update destroy ]

  # GET /wanteds
  def index
    @wanteds = Wanted.paginate(page: params[:page], per_page: 20)
    render json: @wanteds
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wanted
      @wanted = Wanted.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wanted_params
      params.require(:wanted).permit(:nome, :data_aniversario_usada, :cabelo, :olhos, :sexo, :peso, :altura, :raca, :nacionalidade, :crime, :url_foto, :origem)
    end
end
