class AddGuestAndHostToCodosToGuest < ActiveRecord::Migration[5.1]
  def change
    add_column :codos_to_guests, :guest_id, :integer
    add_column :codos_to_guests, :host_id, :integer
    add_column :codos_to_guests, :comments, :text
  end
end
