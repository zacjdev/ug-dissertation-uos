require 'rack-cas/session_store/rails/active_record'
Rails.application.config.session_store ActionDispatch::Session::RackCasActiveRecordStore, key: (Rails.env.production? ? '_security_session_id' : (Rails.env.demo? ? '_security_demo_session_id' : '_security_dev_session_id')),
                                                             secure: (Rails.env.demo? || Rails.env.production?),
                                                             httponly: true
