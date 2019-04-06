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

    expect(current_path).to eq(new_user_path)

    fill_in 'user[email]', with: email
    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on 'Create Team'

    expect(current_path).to eq(roster_path)

    expect(page).to have_content(email)
    expect(page).to have_content(first_name)
    expect(page).to have_content(last_name)
    expect(page).to_not have_content('Sign In')
  end
end