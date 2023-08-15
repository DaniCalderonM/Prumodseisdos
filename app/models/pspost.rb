class Pspost < ApplicationRecord
    belongs_to :psusers
    has_many :applies, dependent: :destroy
    has_many :psusers, through: :applies
    has_many_attached :psimages

    def find_kind_psuser_relation(psuser)
        self.applies.find_by(psuser_id: psuser.id).kind
        end
end
