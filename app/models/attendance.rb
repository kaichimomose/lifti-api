class Attendance < ApplicationRecord
    belongs_to :guest, class_name: "User"
    belongs_to :attend_experience, class_name: "Experience"
end
