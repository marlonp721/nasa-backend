class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :favorite_images, through: :favorites, source: :favoritable, source_type: 'Image'
  has_many :favorite_asteroids, through: :favorites, source: :favoritable, source_type: 'Asteroid'
  
  def generate_jwt
    JWT.encode({ id: id, exp: 1.hours.from_now.to_i }, Rails.application.config.jwt_secret)
  end
end
