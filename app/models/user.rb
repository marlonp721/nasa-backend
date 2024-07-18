class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :favorite_images, through: :favorites, source: :favoritable, source_type: 'Image'
  has_many :favorite_asteroids, through: :favorites, source: :favoritable, source_type: 'Asteroid'
  
  def generate_jwt
    JWT.encode({ id: id, exp: 60.days.from_now.to_i }, Rails.application.credentials.secret_key_base)
  end
end
