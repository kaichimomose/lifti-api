class KudosToGuestsController < ApplicationController
  before_action :set_kudos_to_guest, only: [:show, :update, :destroy]

  # POST /kudos_to_guests
  def create
    kudos = Kudos.find(params[:kudo_id])
    guest = User.find(prams[:guest_id])
    kudos.give_kudos_to_guest(guest)
  end

  # DELETE /kudos_to_guests/1
  def destroy
    @kudos_to_guest.destroy
  end
end
