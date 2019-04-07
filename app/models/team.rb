class Team < ApplicationRecord

  validates :email, uniqueness: true, presence: true
  validates :team_name, uniqueness: true, presence: true
  validates_presence_of :password
  has_secure_password
end
