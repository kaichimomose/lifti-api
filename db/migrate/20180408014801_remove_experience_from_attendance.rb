class RemoveExperienceFromAttendance < ActiveRecord::Migration[5.1]
  def change
      remove_column :attendances, :experience_id
  end
end
