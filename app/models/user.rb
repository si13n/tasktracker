class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one_attached :avatar

  #cope :email, -> (email) { where("email LIKE ?", "#{email}%")}
  #scope :names, -> (name) { where("name LIKE ?", "%#{name}%")}
  #scope :recent, lambda { :conditions => ['updated_at > ? AND admin != ?', 5.minutes.ago, true] }

  scope :search, -> (params) do
        where("email LIKE ?", "%#{params[:email]}%").
        where("name LIKE ?", "#{params[:name]}%").
        where("role LIKE ?", "#{params[:role]}%").
        where(team_id: params[:team]).
        where(active: true)
  end

  def online?
    self.updated_at > 10.minutes.ago
  end
end