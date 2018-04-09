class KudosController < ApplicationController
  before_action :set_kudo, only: [:show, :update, :destroy]

  # POST /kudos
  def create
    @kudo = Kudo.new(kudo_params)
    @kudo.user = current_user

    if @kudo.save
      render json: @kudo, status: :created, location: @kudo
    else
      render json: @kudo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kudos/1
  def update
    if @kudo.update(kudo_params)
      render json: @kudo
    else
      render json: @kudo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /kudos/1
  def destroy
    @kudo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kudo
      @kudo = Kudo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def kudo_params
      params.permit(:comments, :taker_id)
    end
end
