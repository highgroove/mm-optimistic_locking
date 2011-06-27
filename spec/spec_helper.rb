require 'rubygems'
require 'bundler/setup'

require 'rspec'
require 'database_cleaner'

begin
  require 'ruby-debug'
rescue LoadError
end

$:.push(File.expand_path("../lib", File.dirname(__FILE__)))
require 'mm-optimistic_locking'

MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
MongoMapper.database = "mm-optimistic_locking_test"

RSpec.configure do |c|
  c.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with :truncation
  end

  c.before(:each) do
    DatabaseCleaner.start
  end

  c.after(:each) do
    DatabaseCleaner.clean
  end
end
