class AddChecklistResponses < ActiveRecord::Migration[6.1]
  def change

    create_table :checklist_responses do |t|
      t.integer :checklist_template_id
      t.integer :created_by
      t.boolean :questions_response
      t.string :text_response
    end
  end
end