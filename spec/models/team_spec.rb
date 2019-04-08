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
  end
end

