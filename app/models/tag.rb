class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :establishments, through: :taggings
end
