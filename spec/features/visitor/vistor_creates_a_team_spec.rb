require 'rails_helper'

describe 'Visitor' do
  it 'visits the landing page and can create a new team' do
    email = 'bubs@gmail.com'
    team_name = 'The Killer Cat Bots'
    password = 'password'
    password_confirmation = 'password'

    visit '/'

    expect(current_path).to eq(root_path)

    click_on 'Sign In'

    expect(current_path).to eq(login_path)

    click_on 'Create Team'

    expect(current_path).to eq(new_team_path)

    fill_in 'team[email]', with: email
    fill_in 'team[team_name]', with: first_name
    fill_in 'team[password]', with: password
    fill_in 'team[password_confirmation]', with: password

    click_on 'Create Team'

    expect(current_path).to eq(roster_path)

    expect(page).to have_content(email)
    expect(page).to have_content(first_name)
    expect(page).to have_content(last_name)
    expect(page).to_not have_content('Sign In')
  end
end