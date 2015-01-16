class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String

  has_many :comments

  validates :title, :body, presence: true

  def date_published
    created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end
end
