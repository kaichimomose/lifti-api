class Kudo < ApplicationRecord
    belongs_to :user
    validates :comments, :taker_id, presence: true
end
