module MongoMapper
  class StaleDocumentError < MongoMapper::Error
    def initialize(document)
      super("Document #{document.inspect} is stale and must be reloaded from MongoDB")
    end
  end
end
