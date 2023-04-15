class CmodulesController < ApplicationController

    def new
        @mod = Cmodule.new
        render :'lecturer/modules/new'
    end

    def show
        @cmodules = Cmodule.all
        render :'lecturer/modules'
    end

    def create
        @mod = Cmodule.new(m_params)

        if @mod.save
            redirect_to '/lecturer/modules', notice: 'Module was successfully created.'
        else
            render :new
        end
    end


    def m_params 
        params.require(:cmodule).permit(:name)
    end
end