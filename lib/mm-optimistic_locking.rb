require 'mongo_mapper'

require File.expand_path("mongo_mapper/stale_document_error", File.dirname(__FILE__))
require File.expand_path("mongo_mapper/plugins/optimistic_locking", File.dirname(__FILE__))

MongoMapper::Plugins::Querying.class_eval do
  include MongoMapper::Plugins::OptimisticLocking::QueryingInterceptor
end
