class CreateFollowHosts < ActiveRecord::Migration[5.1]
  def change
    create_table :follow_hosts do |t|

      t.timestamps
    end
  end
end
