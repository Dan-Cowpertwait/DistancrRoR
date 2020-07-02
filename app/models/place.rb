class Place < ApplicationRecord
    belongs_to :owner

    has_many :taggings
    has_many :tags, through: :taggings
end
