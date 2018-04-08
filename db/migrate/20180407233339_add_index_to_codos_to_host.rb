class AddIndexToCodosToHost < ActiveRecord::Migration[5.1]
  def change
      add_index :codos_to_hosts, :guest_id
      add_index :codos_to_hosts, :host_id
      add_index :codos_to_hosts, [:guest_id, :host_id], unique: true
  end
end
