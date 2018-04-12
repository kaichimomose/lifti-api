class AddAttachmentGuestImageFileToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      t.attachment :guest_image_file
    end
  end

  def self.down
    remove_attachment :users, :guest_image_file
  end
end
