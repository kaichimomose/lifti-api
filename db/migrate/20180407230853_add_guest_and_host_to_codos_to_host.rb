class AddGuestAndHostToCodosToHost < ActiveRecord::Migration[5.1]
  def change
    add_column :codos_to_hosts, :guest_id, :integer
    add_column :codos_to_hosts, :host_id, :integer
    add_column :codos_to_hosts, :comments, :text
  end
end
