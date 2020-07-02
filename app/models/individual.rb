class Individual < ApplicationRecord
    belongs_to :user

    has_many :visits
    has_many :places, through: :visits


end
