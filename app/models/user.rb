class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reservations
  has_many :restaurants, foreign_key: :owner_id, inverse_of: :owner

  USER_ROLES=["user", "owner", "admin"]
  validates_inclusion_of :role, in: USER_ROLES
  
  def owner? 
  	role == "owner"
  end

  def admin?
  	role == "admin"
  end

end
