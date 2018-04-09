class AddCountsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :follwers_count, :Integer
    add_column :users, :following_count, :Integer
  end
end
