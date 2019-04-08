class Team < ApplicationRecord
  has_many :players
  after_create :get_free_agents

  validates :email, uniqueness: true, presence: true
  validates :team_name, uniqueness: true, presence: true
  validates_presence_of :password
  has_secure_password

  def get_free_agents
    100.times do
      Player.create_player(self)
    end
  end
  
end
