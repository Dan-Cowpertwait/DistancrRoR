class TagsController < ApplicationController
    has_many :taggings, dependent: :destroy
    has_many :places, through: :taggings


end
