module MongoMapper
  autoload :StaleDocumentError, "mongo_mapper/stale_document_error"

  module Plugins
    module OptimisticLocking
      VERSION = "0.0.1"
    end
  end
end
