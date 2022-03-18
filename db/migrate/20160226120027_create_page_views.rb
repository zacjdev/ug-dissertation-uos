class CreatePageViews < ActiveRecord::Migration[4.2]
  def change
    create_table :page_views do |t|
      t.references :user, index: true, foreign_key: true
      t.string :controller_name
      t.string :controller_action
      t.integer :resource_id

      t.timestamps null: false
    end
  end
end
