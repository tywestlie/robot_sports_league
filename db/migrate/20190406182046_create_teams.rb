class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string  :email, index: true
      t.string  :team_name
      t.string  :password_digest

      t.timestamps
    end
  end
end
