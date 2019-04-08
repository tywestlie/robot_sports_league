require 'rails_helper'

describe 'Team Features' do
  it 'team can sign in' do
    team = create(:team)

    visit '/'

    click_on "Sign In"

    expect(current_path).to eq(login_path)

    fill_in 'session[email]', with: team.email
    fill_in 'session[password]', with: team.password

    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content(team.team_name)
  end
end