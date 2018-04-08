class RenameCodosGuestToKudosGuest < ActiveRecord::Migration[5.1]
  def change
      rename_table :codos_to_guests, :kudos_to_guests
  end
end
