class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string :name
      t.string :genre
      t.string :place
      t.string :start_day
      t.string :end_day
      t.string :price
      t.integer :capacity
      t.text :details
      t.text :schedule

      t.timestamps
    end
  end
end
