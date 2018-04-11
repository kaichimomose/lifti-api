class ExperienceSerializer < ActiveModel::Serializer
  attributes :id, :name, :genre, :place, :start_day, :end_day,
             :price, :capacity, :details, :schedule
end
