class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :update, :destroy]

  # GET /experiences
  def index
    @experiences = Experience.all
    render json: @experiences, each_serializer: Experiences::IndexSerializer
  end

  # GET /experiences/1
  def show
    host = User.find(@experience.user_id)
    host.following_count = host.following_counter
    host.followers_count = host.followers_counter
    host.did_follow = current_user.following?(host)
    host.attendances_count = host.attendances_counter
    host.kudos_count = host.kudos_counter
    host.created_experience_count = host.created_experience_counter
    @experience.user = host
    render json: @experience, serializer: Experiences::ShowSerializer
  end

  # GET /experiences/1/guests
  def guests
    @experience  = Experience.find(params[:id])
    @users = @experience.guests
    render json: @users
  end

  # POST /experiences
  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user

    if @experience.save
      render json: @experience, status: :created, location: @experience
    else
      render json: @experience.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /experiences/1
  def update
    if @experience.update(experience_params)
      render json: @experience
    else
      render json: @experience.errors, status: :unprocessable_entity
    end
  end

  # DELETE /experiences/1
  def destroy
    @experience.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def experience_params
      params.permit(:name, :genre, :place, :start_day, :end_day, :price, :capacity, :details, :schedule)
    end
end
