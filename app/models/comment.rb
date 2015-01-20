class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :body, type: String

  belongs_to :post
  embeds_one :commenter

  validates :body, presence: true

  def date_published
    created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end
  
  accepts_nested_attributes_for :commenter

end
