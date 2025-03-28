class User < ApplicationRecord
  validates :name, presence: true
  validates :lastname, presence: true
  validates :birthdate, presence: true
  validates :password, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validate :image_size_validation

  private

  def image_size_validation
    return unless image.present?
    return unless image.size > 50.megabytes

    errors.add(:image, 'should be less than 50MB')
  end
end
