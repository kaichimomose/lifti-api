class AddUsersToKudos < ActiveRecord::Migration[5.1]
  def change
      add_reference :kudos, :user, foreign_key: true
  end
end
