class KudosToHostsController < ApplicationController
  before_action :set_kudos_to_host, only: [:show, :update, :destroy]

  # POST /kudos_to_hosts
  def create
      kudos = Kudos.find(params[:kudo_id])
      host = User.find(prams[:host_id])
      kudos.give_kudos_to_guest(host)
  end

  # DELETE /kudos_to_hosts/1
  def destroy
    @kudos_to_host.destroy
  end
end
