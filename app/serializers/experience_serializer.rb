class ExperienceSerializer < ActiveModel::Serializer
  attributes :id, :name, :genre, :place, :start_day, :end_day,
             :price, :capacity, :details, :schedule, :experience_image_file_url

  def experience_image_file_url
      object.experience_image_file.url()
  end
end
