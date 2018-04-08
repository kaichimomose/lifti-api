class CreateCodosToGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :codos_to_guests do |t|

      t.timestamps
    end
  end
end
