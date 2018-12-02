class Team < ApplicationRecord
    has_many        :players
    has_many        :local_matches, class_name: "Match", foreign_key: "local_id"
    has_many        :visitor_matches, class_name: "Match", foreign_key: "visitor_id"
end