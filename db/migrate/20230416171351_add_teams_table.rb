class AddTeamsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :cmodule
      t.string :name
      t.integer :linkedtomod
    end
  end
end
