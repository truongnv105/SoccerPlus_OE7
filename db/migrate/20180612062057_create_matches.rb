class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :league, foreign_key: true
      t.integer :team_id_1
      t.integer :team_id_2
      t.datetime :start_time
      t.datetime :end_time
      t.integer :point_team_1
      t.integer :point_team_2
      t.integer :live
      t.text :information

      t.timestamps
    end
  end
end
