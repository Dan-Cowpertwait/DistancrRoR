class Place < ApplicationRecord
    after_commit :add_default_picture, on: [:create, :update]

    belongs_to :owner

    has_many :visits, dependent: :destroy
    has_many :individuals, through: :visits

    scope :search, -> (query) { where("name Like ?", "%#{query}%") }

    has_one_attached :image

    def add_default_picture
        unless image.attached?
            self.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "defaultpic.png")), filename: 'defaultpic.png' , content_type: "image/png")
        end
    end 

end
