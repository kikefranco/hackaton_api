class User < ApplicationRecord
  validates :name, presence: true
  validates :lastname, presence: true
  validates :birthdate, presence: true
  validates :password, presence: true
  validates :description, presence: true
  validates :image, presence: true
end
