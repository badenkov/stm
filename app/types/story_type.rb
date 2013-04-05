class StoryType < Story
  include BasicType

  attr_accessible :title, :description, :owner_id, :state_event

  validates :title, presence: true
end
