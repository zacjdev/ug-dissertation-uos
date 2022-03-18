# == Schema Information
#
# Table name: page_views
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  controller_name   :string
#  controller_action :string
#  resource_id       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_page_views_on_user_id  (user_id)
#

class PageView < ApplicationRecord
  belongs_to :user
end
