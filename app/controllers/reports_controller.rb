class ReportsController < ApplicationController

    def new
        @report = Report.new
        @alllinks = UserTeamLinker.where(user_id: current_user.id)
        @allteams = Team.where(id: @alllinks.pluck(:team_id))
        @allteamids = @allteams.pluck(:id)
        @allmodules = Cmodule.all
        render :'student/addreport'
    end


    def create
        @report = Report.new(r_params)

        if @report.save
            redirect_to '/home', notice: 'Report was successfully created.'
        else
            render :new
        end
    end

    def r_params 
        params.require(:report).permit(:content, :team_id)
    end
end