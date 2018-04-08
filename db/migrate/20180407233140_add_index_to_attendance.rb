class AddIndexToAttendance < ActiveRecord::Migration[5.1]
  def change
      add_index :attendances, :guest_id
      add_index :attendances, :experience_id
      add_index :attendances, [:guest_id, :experience_id], unique: true
  end
end
