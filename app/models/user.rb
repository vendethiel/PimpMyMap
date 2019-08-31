class User < ApplicationRecord
  has_many :maps
  has_many :ratings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def admin?
    id == 1
  end

  def mapper?
    id == 2
  end

  def pro?
    id == 3
  end

  def can_rate?(map)
    Rating.where(map: map, user: self).nil?
  end
end
