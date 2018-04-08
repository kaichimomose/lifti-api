class CreateCodosToHosts < ActiveRecord::Migration[5.1]
  def change
    create_table :codos_to_hosts do |t|

      t.timestamps
    end
  end
end
