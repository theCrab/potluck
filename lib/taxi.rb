require "taxi/version"
require 'backports'
require 'datamapper'

# Library namespace
module Taxi
end

DataMapper::Loger.new($stdout, :debug)
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/../db/dev_database.sqlite")

require "taxi/person"
require "taxi/license"
require "taxi/vehicle"

DataMapper.finalize
DataMapper.auto_upgrade!