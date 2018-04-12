class AddAttachmentHostImageFileToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      t.attachment :host_image_file
    end
  end

  def self.down
    remove_attachment :users, :host_image_file
  end
end
