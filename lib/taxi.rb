# require "taxi/version"
require 'backports'
require 'data_mapper'
require 'adamantium'

# Library namespace
module Taxi
end

# DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/dev_database.sqlite")

require "taxi/person"
require "taxi/license"
require "taxi/vehicle"
require "taxi/address"
require "taxi/organisation"
require "taxi/subscription"

DataMapper.finalize
DataMapper.auto_migrate!
# DataMapper.auto_upgrade!