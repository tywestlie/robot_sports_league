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

  def auto_generate_roster
    clear_roster
    
    players_sample = self.players.order('RANDOM()').limit(15).to_a

    starters = players_sample.pop(10)

    starters.each do |starter|
      starter.update(role: "starter")
    end

    players_sample.each do |alternate|
      alternate.update(role: "alternate")
    end
  end

  def clear_roster
    roster = self.players.where(role: ['starter', 'alternate'])

    roster.each do |player|
      player.update(role: 'free_agent')
    end
  end

  
end
