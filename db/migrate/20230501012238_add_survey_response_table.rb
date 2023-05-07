class AddSurveyResponseTable < ActiveRecord::Migration[6.1]
  def change
    create_table :survey_responses do |s|

      s.integer :team_id
      s.integer :user_id
      s.integer :created_by
      s.string :question1response
      s.string :question2response
      s.string :question3response
      s.string :question4response
      s.string :question5response
    end
  end
end
