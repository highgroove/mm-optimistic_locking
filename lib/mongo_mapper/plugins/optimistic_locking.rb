require 'active_support/concern'

require File.expand_path("optimistic_locking/querying_interceptor", File.dirname(__FILE__))

module MongoMapper
  module Plugins
    module OptimisticLocking
      extend ActiveSupport::Concern

      included do |base|
        base.key :_lock_version, Integer, :default => 0
      end
    end
  end
end
