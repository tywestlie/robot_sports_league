require 'rails_helper'

describe 'Visitor' do
  it 'visits the landing page and can create a new team', :js do
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

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content(team_name)
    expect(page).to_not have_content('Sign In')
    expect(page).to_not have_content('Log Out')
  end
end