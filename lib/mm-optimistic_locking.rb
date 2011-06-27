require 'mongo_mapper'

module MongoMapper
  autoload :StaleDocumentError, "mongo_mapper/stale_document_error"

  module Plugins
    autoload :OptimisticLocking, "mongo_mapper/plugins/optimistic_locking.rb"
  end

  module Plugins
    module Querying
      module InstanceMethods
        include MongoMapper::Plugins::OptimisticLocking::QueryingInterceptor
      end
    end
  end
end
