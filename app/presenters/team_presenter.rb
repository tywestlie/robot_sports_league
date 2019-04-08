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
end
