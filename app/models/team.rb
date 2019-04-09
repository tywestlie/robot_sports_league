class Team < ApplicationRecord
  has_many :players
  after_create :get_free_agents

  validates :email, presence: true, uniqueness: { case_sensitive: false }, on: :create
  validates :team_name, presence: true, uniqueness: { case_sensitive: false }, on: :create
  validates_presence_of :password
  has_secure_password

  def get_free_agents
    100.times do
      Player.create_player(self)
    end
  end

  def auto_generate_roster
    clear_roster

    fetch_random_players

    starters = roster.limit(10)

    starters.each do |starter|
      starter.update(role: "starter")
    end
  end

  def clear_roster
    roster.each do |player|
      player.update(role: 'free_agent')
    end
  end

  def fetch_random_players
    player = self.free_agents.sample

    sums = roster.map do |player|
      player.attribute_sum
    end

    if !sums.include?(player.attribute_sum)
      sign_free_agent(player)
    end

    if roster.count < 15
      fetch_random_players
    end
  end

  def sign_free_agent(player)
    player.update(role: "alternate")
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

  def free_agents
    self.players.where(role: 'free_agent')
  end

  def unique_free_agents(player)
    self.players.where(role: 'free_agent').select do |free_player|
      free_player.attribute_sum != player.attribute_sum
    end
  end

end
