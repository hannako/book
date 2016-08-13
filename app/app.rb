ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

require_relative 'server'
require_relative './controllers/link'
require_relative './controllers/tag'
require_relative './controllers/sessions'
require_relative './controllers/user'

# run! if app_file == $0
