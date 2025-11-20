# Load the Rails application.
require_relative "application"

puts "===> Running config/environment.rb"
puts "     Environment: #{ENV.fetch("RAILS_ENV", "missing")}"
puts "     RAILS_MASTER_KEY: #{ENV.fetch("RAILS_MASTER_KEY", "missing")}"
puts "============================"

# Initialize the Rails application.
Rails.application.initialize!
