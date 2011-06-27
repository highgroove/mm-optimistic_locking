require 'active_support/concern'

module MongoMapper
  module Plugins
    module OptimisticLocking
      autoload :QueryingInterceptor, "mongo_mapper/plugins/optimistic_locking/querying_interceptor"

      extend ActiveSupport::Concern

      VERSION = "0.0.1"

      included do |base|
        base.key :_lock_version, Integer, :default => 0
      end
    end
  end
end
