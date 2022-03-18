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

FactoryBot.define do
  factory :post do
    title { "MyString" }
content { "MyText" }
author_id { 1 }
  end

end
