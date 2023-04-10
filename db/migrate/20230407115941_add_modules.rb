class AddModules < ActiveRecord::Migration[6.1]
  def change
    create_table :modules do |t|
      # unique id for each module and auto increment
      t.string :name
      t.string :code
    end
  end
end
