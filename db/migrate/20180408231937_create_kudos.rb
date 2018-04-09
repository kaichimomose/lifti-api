class CreateKudos < ActiveRecord::Migration[5.1]
  def change
    create_table :kudos do |t|
      t.text :comments

      t.timestamps
    end
  end
end
