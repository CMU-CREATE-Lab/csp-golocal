class Cuisine < ApplicationRecord
    has_and_belongs_to_many :businesses
    ##belongs_to :parent_cuisine_id, class_name: 'Cuisine', optional: true

    # Self-referential association
    belongs_to :parent_cuisine, class_name: 'Cuisine', optional: true
    has_many :children, class_name: 'Cuisine', foreign_key: 'parent_cuisine_id'

    validates :name, presence: true, uniqueness: true
    #validates :parent_cuisine_id, allow_nil: true
end
