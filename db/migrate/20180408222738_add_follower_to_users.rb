class AddFollowerToUsers < ActiveRecord::Migration[5.1]
  def change
      remove_column :users, :follwers_count, :Integer
      add_column :users, :followers_count, :Integer
  end
end
