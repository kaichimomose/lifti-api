class RemoveFollowingwerFormUsers < ActiveRecord::Migration[5.1]
  def change
      remove_column :users, :followers_count
      remove_column :users, :following_count
  end
end
