# == Schema Information
#
class UserTeamLinker < ApplicationRecord
    self.table_name = "teams_users"
    belongs_to :team
    belongs_to :user
  end
  