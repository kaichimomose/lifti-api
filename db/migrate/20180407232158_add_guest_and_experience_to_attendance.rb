class AddGuestAndExperienceToAttendance < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :guest_id, :integer
    add_column :attendances, :experience_id, :integer
  end
end
