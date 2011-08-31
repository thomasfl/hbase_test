Notes
=====

HBase
-----

To start hbase server, and thrift server used by massive_record gem to communicate with the server:

> $ cd ~/src/hbase-0.90.3-cdh3u1/bin
> $ ./start-hbase.sh
> $ ./hbase-daemon.sh start thrift -p 9090

To use the irb shell or to stop it:
> $ ~/src/hbase-0.90.3-cdh3u1/bin/hbase shell
> $ ~/src/hbase-0.90.3-cdh3u1/bin/stop-hbase.sh

Create the initial database (and seed values?)

  column_family :info do
    field :title
    field :content
    field :author_name
    field :author_email
  end


create 'posts', 'cf'

put 'posts', 'post1', 'cf:title', 'First blog posting'
put 'posts', 'post1', 'cf:content', 'This is a blog post'
put 'posts', 'post1', 'cf:author_name', 'Thomas Flemming'
put 'posts', 'post1', 'cf:author_email', 'thomas.flemming@gmail.com'



Markdown
--------

To update this documentation.

>  $ rdiscount README.md

Installation
------------

Remove Gemfile.lock before


Problemer som oppstod underveis
===============================

- Det stod ikke i at man må starte opp thrift serveren
- Eksempelappen har sjekket inn Gemfile.lock, som man må huske på å slette først.


