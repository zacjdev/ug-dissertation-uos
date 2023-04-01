class IndexController < ApplicationController
    def index
      if current_user.role == 'student'
        redirect_to '/home'
      elsif current_user.role == 'admin'
        redirect_to '/dashboard'
      else
        render :'pages/no_access'
      end
    end
  end
  