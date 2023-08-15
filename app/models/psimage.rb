class Psimage < ApplicationRecord
  belongs_to :psimageable, polymorphic: true
end
