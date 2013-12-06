class User < ActiveRecord::Base
  has_many :ownerships
  has_many :summoners, through: :ownerships
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
