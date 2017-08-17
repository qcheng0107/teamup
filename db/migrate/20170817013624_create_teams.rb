class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :session_id
      t.string :team_name
      t.integer :user_id

      t.timestamps

    end
  end
end
