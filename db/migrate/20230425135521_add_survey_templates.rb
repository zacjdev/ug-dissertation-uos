class AddSurveyTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :survey_templates do |s|
      s.string :question1
      s.string :question2
      s.string :question3
      s.string :question4
      s.string :question5
    end
  end
end
