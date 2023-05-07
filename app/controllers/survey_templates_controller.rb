class SurveyTemplatesController < ApplicationController

    def new 
        @survey = SurveyTemplate.new
        render :'lecturer/surveys/new'
    end

    def create
        @survey = SurveyTemplate.new(r_params)
        if @survey.save
            redirect_to '/dashboard', notice: 'Survey template was successfully created.'
        else
            render :new
        end
    end

    def r_params 
        params.require(:survey_template).permit(:question1, :question2, :question3, :question4, :question5)
    end
end