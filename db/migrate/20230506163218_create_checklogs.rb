class CreateChecklogs < ActiveRecord::Migration[6.1]
  def change
    create_table :checklogs do |t|
      t.integer :checklist_template_id
      t.integer :created_by
      t.integer :team_id
      t.boolean :questions_response
      t.string :text_response
    end
  end
end
