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

  # For pagination
  # Example. Post.get_start_and_offset(5,"42")
  def self.get_start_and_offset(limit,offset)
    @posts = []
    self.table.all(:limit => limit, :start => offset).each do |record|
      @posts << Post.find(record.id)
    end
    return @posts
  end

  def tags_as_string
    if(tags)
      tags.join(', ')
    else
      ""
    end
  end

  private

  def default_id
    next_id
  end

  def posts_start_id
    id+'-'
  end

end
