class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :update, :destroy]

  # POST /attendances
  def create
    experience = Experience.find(params[:experience_id])
    guest = User.find(prams[:guest_id])
    guest.attend(experience)
  end

  # DELETE /attendances/1
  def destroy
    experience = Attendance.find(params[:id]).attend_experience
    guest = User.find(prams[:guest_id])
    guest.cancel(experience)
  end

end
