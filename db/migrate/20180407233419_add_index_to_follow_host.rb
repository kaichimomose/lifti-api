class AddIndexToFollowHost < ActiveRecord::Migration[5.1]
  def change
      add_index :follow_hosts, :follower_id
      add_index :follow_hosts, :followed_id
      add_index :follow_hosts, [:follower_id, :followed_id], unique: true
  end
end
