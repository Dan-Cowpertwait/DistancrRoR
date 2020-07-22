class Individual < ApplicationRecord
    after_commit :add_default_picture, on: [:create, :update]
    belongs_to :user

    has_many :visits, dependent: => :destroy
    has_many :places, through: :visits

    has_one_attached :profile_pic

    private

    def add_default_picture
        unless profile_pic.attached?
            self.profile_pic.attach(io: File.open(Rails.root.join("app", "assets", "images", "defaultpic.png")), filename: 'defaultpic.png' , content_type: "image/png")
        end
    end 

end
