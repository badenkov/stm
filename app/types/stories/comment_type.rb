class Stories::CommentType < Comment
  include BasicType

  attr_accessible :body

  validates :body, presence: true
end
