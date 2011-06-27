mm-optimistic_locking
=====================

mm-optimistic_locking implements optimistic locking in mongo_mapper.

Optimistic Locking?
-------------------

When attempting to save a record, optimistic locking verifies that the
record has not been modified by another process since it was earlier loaded
into memory.  If it has been modified and resaved since that time, an error is
raised and the record must be reloaded and resaved again.

Optimistic locking is appropriate when the chance of a conflict is low
and records can easily recover when a conflict does occur (e.g., simply
by retrying the operations or by asking an end user to manually resolve the
conflict).

Before using mm-optimistic_locking, you should first consider if your use case
for locking can be handled by MongoDB's various [atomic operations](http://www.mongodb.org/display/DOCS/Atomic+Operations).
It is possible that you do not need this type of locking at all.

Quickstart
----------

If using Bundler (e.g., with Rails 3), add the gem to your project's
Gemfile:

``` ruby
gem 'mm-optimistic_locking'
```

And run `bundle install`.

Next, include `MongoMapper::Plugins::OptimisticLocking` in each model
that needs optimistic locking functionality.

``` ruby
class BlogPost
  include MongoMapper::Document

  # Add the following line to each model that needs optimistic locking
  plugin MongoMapper::Plugins::OptimisticLocking
end
```

Finally, make sure to rescue from `MongoMapper::StaleDocumentError`
any time you save a model with optimistic locking functionality:

``` ruby
begin
  blog_post.save
rescue MongoMapper::StaleDocumentError
  # Reload, remodify, and resave
end
```

Related Projects
----------------

* [mongo_mapper](http://mongomapper.com/)

Contributing
------------

* Fork the repository on [GitHub](https://github.com/highgroove/mm-optimistic_locking)
* Create a [feature branch](http://nvie.com/posts/a-successful-git-branching-model/) (a.k.a., create a branch named my-awesome-feature)
* Write the new feature (please also add specs)
* Make sure all specs pass: `rake spec`
* Submit a pull request that only includes your feature branch
