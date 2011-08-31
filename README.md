HBaseBlog
=========

Simple blog implemented i ruby on rails using hbase to store posts. Uses slim for templates.

HBase
-----

To install hbase, simply download and unpack. To start hbase, start both the hbase server AND the thrift server:

    $ cd ~/src/hbase-0.90.3-cdh3u1/bin
    $ ./start-hbase.sh
    $ ./hbase-daemon.sh start thrift -p 9090

To use the hbase ruby (jruby irb) shell:
    $ ~/src/hbase-0.90.3-cdh3u1/bin/hbase shell

To create table and column families.

    create 'posts', 'cf'

To add som seed values from the shell:

    put 'posts', 'post1', 'cf:title', 'First blog posting'
    put 'posts', 'post1', 'cf:content', 'This is a blog post'
    put 'posts', 'post1', 'cf:author_name', 'Thomas Flemming'
    put 'posts', 'post1', 'cf:author_email', 'thomas.flemming@gmail.com'

TODO
----

* Add tags to blog posts
* Pagination if more than 5 posts is displayed on the index page
