class CreateTimeGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :time_goals do |t|
      t.references :match, foreign_key: true
      t.datetime :time_goal
      t.integer :team_id

      t.timestamps
    end
  end
end
