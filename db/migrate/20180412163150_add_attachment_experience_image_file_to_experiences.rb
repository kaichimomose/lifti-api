class AddAttachmentExperienceImageFileToExperiences < ActiveRecord::Migration[5.1]
  def self.up
    change_table :experiences do |t|
      t.attachment :experience_image_file
    end
  end

  def self.down
    remove_attachment :experiences, :experience_image_file
  end
end
