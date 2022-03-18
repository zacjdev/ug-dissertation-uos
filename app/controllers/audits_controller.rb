class AuditsController < ApplicationController

  before_action :set_nav_indentifier
  authorize_resource :audit_log, class: false

  def index
    @audits = Audited::Audit.all
    @page_views = PageView.all
  end

  private

    def set_nav_indentifier
      @current_nav_identifier = :audits
    end

end