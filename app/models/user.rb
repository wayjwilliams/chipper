class User < ActiveRecord::Base
  has_many :cheeps
  has_many :followings
  has_many :followers, :through => :followings
  validates :username, presence: true
  validates :password, presence: true, confirmation: true
end
