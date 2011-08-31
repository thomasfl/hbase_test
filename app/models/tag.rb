class Tag < MassiveRecord::ORM::Column

  references_many :post, :class_name => "Post"

  field :tag

end

# references_one :post, :polymorphic => true, :store_in => :cf

#   default_scope select(:cf)

#   column_family :cf do
#     field :tag
#   end

#   attr_accessible :tag

#   private

#   def default_id
#     # raise "Must have a post set" if post.nil?
#     [post_type, post_id, next_id].join('-')
#   end

# end
