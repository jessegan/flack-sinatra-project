ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :drop_all do
    puts "Dropping the databases...."
    system "rm db/schema.rb"
  end
  