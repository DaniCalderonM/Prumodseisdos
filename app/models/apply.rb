class Apply < ApplicationRecord
  belongs_to :psuser
  belongs_to :pspost, optional: true

  validates :kind, acceptance: {
    accept: %w[ Aplicar ]
    }
    
    def self.kinds
      %w[ Aplicar ]
      end

end