class FollowHostsController < ApplicationController
  before_action :set_follow_host, only: [:show, :update, :destroy]

  # POST /follow_hosts
  def create
      host = User.find(params[:followed_id])
      current_user.follow(host)
    # @follow_host = FollowHost.new(follow_host_params)
    #
    # if @follow_host.save
    #   render json: @follow_host, status: :created, location: @follow_host
    # else
    #   render json: @follow_host.errors, status: :unprocessable_entity
    # end
  end

  # DELETE /follow_hosts/1
  def destroy
      host = FollowHost.find(params[:id]).followed
      current_user.unfollow(host)
  end

end
