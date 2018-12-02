class Match < ApplicationRecord
    belongs_to      :week
    has_one         :championship, through: :week
    belongs_to      :local, class_name: "Team"
    belongs_to      :visitor, class_name: "Team"
end