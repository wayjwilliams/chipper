class Following < ActiveRecord::Base
  belongs_to :user
  has_many :cheeps, through: :users
end
