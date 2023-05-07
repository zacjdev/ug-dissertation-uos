class AddSurveyResponses < ActiveRecord::Migration[6.1]
  def change
    
    # add string created_by to survey_responses
    add_column :survey_responses, :created_by, :string
  end
end
