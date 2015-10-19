# Handles the users of the application
class User < ActiveRecord::Base
  has_secure_password
end
