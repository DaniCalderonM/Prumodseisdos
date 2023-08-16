class Apply < ApplicationRecord
  belongs_to :psuser, optional: true
  belongs_to :pspost, optional: true

  validates :kind, acceptance: {
    accept: %w[ Aplicar ]
    }
    
    def self.kinds
      %w[ Aplicar ]
      end

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  private

  def notify_recipient
    ApplyNotification.with(apply: self, pspost: pspost).deliver_later(Psuser.first)
  end

  def cleanup_notifications
    notifications_as_apply.destroy_all
  end

end