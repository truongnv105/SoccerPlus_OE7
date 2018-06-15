class CreateTimeGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :time_goals do |t|
      t.references :match, foreign_key: true
      t.integer :time_goal
      t.integer :team_id, foreign_key: true

      t.timestamps
    end
  end
end
