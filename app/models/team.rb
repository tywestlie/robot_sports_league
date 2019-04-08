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

    roster_array = fetch_random_players

    starters = roster_array.pop(10)

    starters.each do |starter|
      starter.update(role: "starter")
    end

    roster_array.each do |alternate|
      alternate.update(role: "alternate")
    end
  end

  def clear_roster
    roster.each do |player|
      player.update(role: 'free_agent')
    end
  end

  def fetch_random_players
    players = self.players.order(Arel.sql('RANDOM()')).limit(15).to_a

    sums = players.map do |player|
      player.attribute_sum
    end

    if sums.uniq.count != 15
      fetch_random_players
    else
      return players
    end
  end

  def roster
    self.players.where(role: ['starter', 'alternate'])
  end

  def starters
    self.players.where(role: 'starter')
  end

  def alternates
    self.players.where(role: 'alternate')
  end

end
