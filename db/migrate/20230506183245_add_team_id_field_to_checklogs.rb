class AddTeamIdFieldToChecklogs < ActiveRecord::Migration[6.1]
  def change
    add_column :checklogs, :team_id, :integer
  end
end
