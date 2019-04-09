require 'rails_helper'

describe 'Team Roster Edit Features' do
  it 'team can edit a roster' do
    email = 'bubs@gmail.com'
    team_name = 'The Killer Cat Bots'
    password = 'password'
    password_confirmation = 'password'

    visit '/'

    expect(current_path).to eq(root_path)

    within('.welcome-btns') do
      click_on 'SIGN UP'
    end

    expect(current_path).to eq(new_team_path)

    fill_in 'team[email]', with: email
    fill_in 'team[team_name]', with: team_name
    fill_in 'team[password]', with: password
    fill_in 'team[password_confirmation]', with: password

    click_on 'Create Team'

    visit dashboard_path

    team = Team.find_by(team_name: team_name)

    click_on 'Generate Roster'

    within(first('.card-action')) do
      click_on 'Replace Player'
    end

    expect(page).to eq("/team/#{team.id}/players")

  end
end
