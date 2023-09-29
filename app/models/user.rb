class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  has_many :postulations
  has_many :offers, through: :postulations
  has_one_attached :photo

  enum role: [:normal_user, :admin]
end
