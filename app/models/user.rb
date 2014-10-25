class User < ActiveRecord::Base
  has_many :cheeps
  validates :username, presence: true
  validates :password, presence: true, confirmation: true
end
