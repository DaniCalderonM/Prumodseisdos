class Pspost < ApplicationRecord
    has_and_belongs_to_many :psusers
    has_many_attached :psimages
end
