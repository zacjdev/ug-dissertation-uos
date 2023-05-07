class StudentsController < ApplicationController
    def home
        @alllinks = UserTeamLinker.where(user_id: current_user.id)
        @allteams = Team.where(id: @alllinks.pluck(:team_id))
        @allmodules = Cmodule.all
        render :'student/home'
    end

    def showteam
        @team = Team.where(id: params[:id]).first
        @cmodule = Cmodule.where(id: @team.name).first
        @alllinks = UserTeamLinker.where(team_id: params[:id])
        @users = User.all
        @surveys = SurveyTemplate.first
        render :'student/viewteam'
    end

    def takesurvey
        @survey = SurveyResponse.new
        @surveytemplate = SurveyTemplate.first
        @studentid = User.where(id: params[:id]).first
        @studentname = @studentid.name
        @alllinks = UserTeamLinker.where(user_id: @studentid.id)
        @team = Team.where(id: @alllinks.pluck(:team_id)).first
        @teamid = @team.id
        render :'student/takesurvey'
    end
end