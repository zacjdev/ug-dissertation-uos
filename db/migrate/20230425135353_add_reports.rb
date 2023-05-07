class AddReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |r|
      r.integer :team_id 
      r.string :content 
      r.integer :created_by_user_id
    end
  end
end
