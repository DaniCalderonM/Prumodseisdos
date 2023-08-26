class Pspost < ApplicationRecord
    belongs_to :psuser, optional: true
    has_many :applies, dependent: :destroy
    has_many :psusers, through: :applies, dependent: :destroy
    
    has_many_attached :psimages

    def find_kind_psuser_relation(psuser)
        self.applies.find_by(psuser_id: psuser.id).kind
        end

    has_noticed_notifications model_name: 'Notification'
    has_many :notifications, through: :psuser, dependent: :destroy
end
