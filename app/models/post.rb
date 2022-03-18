# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string
#  content      :text
#  author_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  private_post :boolean          default(FALSE)
#  link         :string
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#

class Post < ApplicationRecord
  audited
  belongs_to :author, class_name: 'User'

  def author_name
    author.try(:name)
  end
  
end
