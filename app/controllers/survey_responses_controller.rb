class SurveyResponsesController < ApplicationController

    def new 
        @survey = SurveyResponse.new
        render :'lecturer/surveys/new'
    end

    def create
        @survey = SurveyResponse.new(r_params)
        if @survey.save
            redirect_to '/home', notice: 'Survey response was successfully created.'
        else
            render :new
        end
    end

    def r_params 
        params.require(:survey_response).permit(:team_id, :user_id, :created_by, :question1response, :question2response, :question3response, :question4response, :question5response)
    end
end