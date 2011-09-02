# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

include Rake::DSL

for i in 1..20 do
  post = Post.new
  post.title = i.to_s + ' blog posting'
  post.author_name = 'Thomas'
  post.content =  'Some content'
  post.author_email = 'thomas.flemming@gmail.com'
  post.save
  puts i.to_s
end

