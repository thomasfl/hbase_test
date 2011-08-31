class Post < MassiveRecord::ORM::Table

  ## references_many :tags, :store_in => :cf
  # references_many :emails, :records_starts_from => :tags_starts_from
  references_many :tags, :records_starts_from => :posts_start_id

  default_scope select(:cf)

  column_family :cf do
    field :title
    field :content
    field :author_name
    field :author_email
  end

  attr_accessible :title, :content, :author_name, :author_email

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

  private

  def default_id
    next_id
  end

  def posts_start_id
    id+'-'
  end

end
