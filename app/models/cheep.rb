class Cheep < ActiveRecord::Base
  belongs_to :user
  validates :cheep_talk, presence: true, length: {maximum: 140, minimum: 5}
end
