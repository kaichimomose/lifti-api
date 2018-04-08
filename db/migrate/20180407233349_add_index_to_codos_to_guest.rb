class AddIndexToCodosToGuest < ActiveRecord::Migration[5.1]
  def change
      add_index :codos_to_guests, :guest_id
      add_index :codos_to_guests, :host_id
      add_index :codos_to_guests, [:guest_id, :host_id], unique: true
  end
end
