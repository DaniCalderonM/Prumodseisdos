class Psuser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_and_belongs_to_many :psposts
         has_one_attached :avatar
         enum :role, [:normal_psuser, :admin]
end
