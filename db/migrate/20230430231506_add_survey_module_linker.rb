class AddSurveyModuleLinker < ActiveRecord::Migration[6.1]
  def change
    create_join_table :teams, :surveys do |t|
      t.index [:team_id, :survey_id]
      t.index [:survey_id, :team_id]
    end
  end
end
