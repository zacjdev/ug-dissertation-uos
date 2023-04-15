class LecturerController < ApplicationController
    def home
        render :'lecturer/home'
    end

    def modules
        @cmodules = Cmodule.all
        render :'lecturer/modules'
    end

    def surveys
        render :'lecturer/surveys'
    end

    def checklists
        render :'lecturer/checklists'
    end

    def users
        render :'lecturer/users'
    end
end