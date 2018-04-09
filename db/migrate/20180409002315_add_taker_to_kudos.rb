class AddTakerToKudos < ActiveRecord::Migration[5.1]
  def change
    add_column :kudos, :taker_id, :integer
  end
end
