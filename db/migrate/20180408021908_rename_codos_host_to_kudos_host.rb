class RenameCodosHostToKudosHost < ActiveRecord::Migration[5.1]
  def change
      rename_table :codos_to_hosts, :kudos_to_hosts
  end
end
