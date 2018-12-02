class Championship < ApplicationRecord
    # Validations
    validates_presence_of :city, :name, :start_date, :end_date

    # Relationships
    has_many        :weeks
    has_many        :matches, through: :weeks

    accepts_nested_attributes_for :weeks
end