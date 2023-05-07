# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  admin                  :boolean          default(FALSE)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryBot.define do
    factory :user do
  
      username { "Test user" }
      email { "test@sheffield.ac.uk.com" }
      password { "Password1!" }
      password_confirmation { "Password1!" }
      role { "" }
  
      factory :facilitator do
        role { 'facilitator' }
      end
  
      factory :notetaker do
        role { 'notetaker' }
      end
  
      factory :student do
        role { 'student' }
      end
    end
  end
  