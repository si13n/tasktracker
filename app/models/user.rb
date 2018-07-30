class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one_attached :avatar

 def self.roles
  ["Tester", "Developer", "BA", "TST Manager", "DEV Manager"]
 end

  scope :search, -> (params) do
        where("email LIKE ?", "%#{params[:email]}%").
        where("name LIKE ?", "#{params[:name]}%").
        where("role LIKE ?", "#{params[:role]}%").
        where("team_id LIKE ?", "#{params[:team]}%").
        where("active LIKE ?", "#{params[:active]}%")
  end

  def online?
    self.updated_at > 10.minutes.ago
  end
end