class LecturerController < ApplicationController
    def home
        render :'lecturer/home'
    end

    def modules
        @cmodules = Cmodule.all
        render :'lecturer/modules'
    end

    def surveys
        @surveytemplates = SurveyTemplate.all
        render :'lecturer/surveys'
    end

    def checklists
        @checklist_templates = ChecklistTemplate.all
        @checklogs = Checklog.all
        render :'lecturer/checklists'
    end

    def users
        @users = User.all
        render :'lecturer/users'
    end
end