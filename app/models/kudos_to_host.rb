class KudosToHost < ApplicationRecord
    belongs_to :guest, class_name: "Kudo"
    belongs_to :host, class_name: "User"
end
