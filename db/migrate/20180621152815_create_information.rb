class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.references :match, foreign_key: true
      t.text :detail

      t.timestamps
    end
  end
end
