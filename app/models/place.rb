class Place < ApplicationRecord
    belongs_to :owner

    has_many :visits
    has_many :individuals, through: :visits
end
