require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:team_name)}
  end

  describe 'instance methods' do
    it 'creates a team of unique robot players' do
      team = create(:team)

      players = team.players

      expect(players.count).to eq(100)

      players.each do |player|
        expect(player.attribute_sum < 100)
        expect(player.unique_id.length).to eq(6)
      end

      player_ids = players.map do |player|
        player.unique_id
      end

      expect(player_ids.uniq.count).to eq(100)

      player_names = players.map do |player|
        player.name
      end

      expect(player_names.uniq.count).to eq(100)
    end

    it 'auto_generates a roster' do
      team = create(:team)

      team.auto_generate_roster

      players = team.players

      roster = players.where(role: ['starter', 'alternate'])
      starters = players.where(role: 'starter')
      alternates = players.where(role: 'alternate')



      expect(roster.count).to eq(15)
      expect(starters.count).to eq(10)
      expect(alternates.count).to eq(5)
    end

    it 'clears a roster' do
      team = create(:team)

      team.auto_generate_roster

      players = team.players

      roster = players.where(role: ['starter', 'alternate'])
      starters = players.where(role: 'starter')
      alternates = players.where(role: 'alternate')



      expect(roster.count).to eq(15)
      expect(starters.count).to eq(10)
      expect(alternates.count).to eq(5)

      team.clear_roster

      expect(roster.count).to eq(0)
      expect(starters.count).to eq(0)
      expect(alternates.count).to eq(0)
    end

    it 'creates roster with unique attribute sums and names' do
      team = create(:team)

      team.auto_generate_roster

      roster = team.roster

      roster_sums = roster.map do |r|
        r.attribute_sum
      end

      roster_names = roster.map do |r|
        r.name
      end

      expect(roster_names.uniq.count).to eq(15)
      expect(roster_sums.uniq.count).to eq(15)
    end

    it 'can get unique free agents' do
      team = create(:team)

      team.auto_generate_roster

      player = team.roster.first
    
      expect(team.unique_free_agents(player).length).to_not eq(team.free_agents.length)
    end
  end
end
