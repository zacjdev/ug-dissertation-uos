class AddUDetailsToUSer < ActiveRecord::Migration[4.2]
  def change
    change_table :users do |t|
      t.string  :name
      t.boolean :admin, default: false
    end
  end
end
