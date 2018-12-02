class Week < ApplicationRecord
    validates_presence_of       :name, :date

    belongs_to      :championship
    has_many        :matches
    accepts_nested_attributes_for       :matches
end