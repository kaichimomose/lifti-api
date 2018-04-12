class Experience < ApplicationRecord
    belongs_to :user
    attribute :user

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

    has_attached_file :experience_image_file
    validates_attachment :experience_image_file, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/x-png', 'image/gif']}
end
