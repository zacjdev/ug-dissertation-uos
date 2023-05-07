class AddChecklistTemplate < ActiveRecord::Migration[6.1]
  def change
    create_table :checklist_templates do |t|
      t.string :name, null: false
      t.string :questions
    end
  end
end
