class CmodulesController < ApplicationController

    def new
        @mod = Cmodule.new
        render :'lecturer/modules/new'
    end

    def show
        @cmodule = Cmodule.where(id: params[:id]).first
        @teams = Team.where(name: params[:id])
        @reports = Report.all
        render :'lecturer/modules/view'
    end

    def create
        @mod = Cmodule.new(m_params)

        if @mod.save
            redirect_to '/lecturer/modules', notice: 'Module was successfully created.'
        else
            render :new
        end
    end

    def add_team
        @team = Team.new
        render :'lecturer/add_team'
    end

    def m_params 
        params.require(:cmodule).permit(:name)
    end
end