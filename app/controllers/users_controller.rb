class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :require_login, only: [:create], raise: false

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    # render json: @user, :methods => :followers_count :following_count
    @user.followers_count = @user.followers_counter
    @user.following_count = @user.following_counter
    render :json => @user
  end

  # GET /users/1/following
  def following
    @user  = User.find(params[:id])
    @users = @user.following
    render json: @users
  end

  # GET /users/1/followers
  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render json: @users
  end

  # GET /users/1/attend_experiences
  def attend_experiences
    @user  = User.find(params[:id])
    @experiences = @user.attend_experiences
    render json: @experiences
  end

  # GET /users/1/given_kudos
  def given_kudos
    @user  = User.find(params[:id])
    @kudos = @user.get_kudos
    render json: @kudos
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:name, :email, :password, :title, :bio, :host)
    end
end
