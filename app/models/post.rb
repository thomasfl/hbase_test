class Post < MassiveRecord::ORM::Table

  default_scope select(:cf)

  column_family :cf do
    field :title, :string
    field :content, :string
    field :author_name, :string
    field :author_email, :string
    field :tags, :array
  end

  attr_accessible :title, :content, :author_name, :author_email, :tags

  validates_presence_of :title, :content, :author_name, :author_email
  validates_format_of :author_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def tags_as_string
    if(tags)
      tags.join(', ')
    else
      ""
    end
  end

  private

#  def default_id
#    length = next_id.to_s.length
#    padded_id = '0' * (8-length)  + next_id.to_s  unless length>8
#  end

end
