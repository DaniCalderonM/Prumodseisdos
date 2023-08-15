class Psuser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :psposts, through: :applies
         has_many :applies
         has_one_attached :avatar
         enum :role, [:normal_psuser, :admin]
end
