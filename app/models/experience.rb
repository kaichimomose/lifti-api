class Experience < ApplicationRecord
    belongs_to :user
    
    has_many :attendances, class_name:  "Attendance",
                           foreign_key: "attend_experience_id",
                           dependent:   :destroy
    has_many :guests, through: :attendances

    validates :name, presence: true
    validates :genre, presence: true
    validates :place, presence: true
    validates :start_day, presence: true
    validates :end_day, presence: true
    validates :price, presence: true
    validates :capacity, presence: true
end
