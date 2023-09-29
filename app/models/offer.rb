class Offer < ApplicationRecord
  has_many :postulations
  has_many :users, through: :postulations
  has_one_attached :image
end
