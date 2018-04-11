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
    render json: @experiences, each_serializer: Experiences::IndexSerializer
  end

  # GET /users/1/given_kudos
  def given_kudos
    @user  = User.find(params[:id])
    @kudos = @user.given_kudos
    render json: @kudos, each_serializer: Kudos::IndexSerializer
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

  def follow
      host = User.find(params[:followed_id])
      current_user.follow(host)
      @follow_host = current_user.active_relationships.find_by_followed_id(2)
      render json: @follow_host, status: :created
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

  def unfollow
      host = User.find(params[:followed_id])
      current_user.unfollow(host)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      @user.followers_count = @user.followers_counter
      @user.following_count = @user.following_counter
      @user.did_follow = current_user.following?(@user)
      @user.attendances_count = @user.attendances_counter
      @user.kudos_count = @user.kudos_counter
      @user.created_experience_count = @user.created_experience_counter
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:name, :email, :password, :title, :bio, :host)
    end
end
