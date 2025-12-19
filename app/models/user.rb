class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tools

  MAX_DIST = 3
  
  def total_neighbours
    User.all.size
  end

  def nearby_users
    allUsers = User.select(:id, :name, :latlng)
    allUsers.select do |user|
      user.id != self.id && self.is_nearby?(user)
    end
  end

  def nearby_tools
    nearbyIds = self.nearby_users.map(&:id)
    Tool.includes(:user).where(user_id: nearbyIds)
  end

  def is_nearby?(neighbour)
    cuLat, cuLng = self.latlng.split(', ').map(&:to_f)
    ouLat, ouLng = neighbour.latlng.split(', ').map(&:to_f)
    ml = (cuLat + ouLat) / 2
    kilperDistLat = 111.13209 - 0.56605 * Math.cos(2*ml) + 0.00120 * Math.cos(4*ml)
    kilPerDistLon = 111.41513 * Math.cos(ml) - 0.09455 * Math.cos(3*ml) + 0.00012 * Math.cos(5*ml)
    nsDist = kilperDistLat * (cuLat - ouLat)
    ewDist = kilPerDistLon * (cuLng - ouLng)
    dist = Math.sqrt(nsDist**2 + ewDist**2)
    dist < MAX_DIST
  end
end
