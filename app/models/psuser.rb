class Psuser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :applies, dependent: :destroy
         has_many :psposts, through: :applies, dependent: :destroy
         has_one_attached :avatar
         has_many :notifications, as: :recipient, dependent: :destroy
         enum :role, [:normal_psuser, :admin]
end
