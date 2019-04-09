class TeamPresenter
  attr_reader :team

  def initialize(team)
    @team = team
  end

  def roster
    team.roster
  end

  def starters
    team.starters
  end

  def alternates
    team.alternates
  end

  def unique_free_agents(player)
    team.unique_free_agents(player)
  end

end
