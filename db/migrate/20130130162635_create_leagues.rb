class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.integer :season_id
      t.string :name

      t.timestamps
    end
  end
end
