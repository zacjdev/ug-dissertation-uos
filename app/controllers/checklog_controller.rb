class ChecklogController < ApplicationController
    authorize_resource
    def new 
        @checklog = Checklog.new
        @teams = Team.all
        @idofchecklist = params[:id]
        @checklist_template = ChecklistTemplate.find(@idofchecklist)
        render :'lecturer/checklogs/new'
    end

    def create
        @checklog = Checklog.new(r_params)
        if @checklog.save
            redirect_to '/dashboard', notice: 'Checklist log was successfully created.'
        else
            render :new
        end
    end

    def r_params 
        params.require(:checklog).permit(:created_by, :checklist_template_id, :team_id, :questions_response, :text_response)
    end
end
