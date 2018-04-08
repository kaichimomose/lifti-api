class AddAttendExperienceToAttendances < ActiveRecord::Migration[5.1]
  def change
      add_column :attendances, :attend_experience_id, :integer
      add_index :attendances, :attend_experience_id
      add_index :attendances, [:guest_id, :attend_experience_id], unique: true
  end
end
