class AddFollowerIdAndFollowedIdToFollowHost < ActiveRecord::Migration[5.1]
  def change
    add_column :follow_hosts, :follower_id, :integer
    add_column :follow_hosts, :followed_id, :integer
  end
end
