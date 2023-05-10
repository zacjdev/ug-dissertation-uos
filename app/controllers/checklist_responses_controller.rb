class ChecklistResponsesController < ApplicationController
    authorize_resource
    def new 
        @checklist = ChecklistTemplate.new
        render :'lecturer/checklists/new'
    end

    def create
        @checklist = ChecklistTemplate.new(r_params)
        if @checklist.save
            redirect_to '/dashboard', notice: 'Checklist template was successfully created.'
        else
            render :new
        end
    end

    def r_params 
        params.require(:checklist_template).permit(:name, :questions)
    end
end