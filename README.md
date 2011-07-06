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
  # .. making modifications to blog_post ..
  blog_post.save
rescue MongoMapper::StaleDocumentError
  # Reload, remodify, and resave
  # e.g.:
  blog_post.reload
  retry
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

MIT License
-----------
Copyright (c) 2011 Highgroove Studios

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

![Readme.meme](http://i.imgur.com/W3Gob.png)
