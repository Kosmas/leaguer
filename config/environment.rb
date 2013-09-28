# Load the Rails application.
require File.expand_path('../application', __FILE__)
require "coveralls"
Coveralls.wear!('rails')

# Initialize the Rails application.
Leaguer::Application.initialize!
