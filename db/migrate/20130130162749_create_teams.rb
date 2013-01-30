class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :division_id
      t.string :name
      t.string :city

      t.timestamps
    end
  end
end
