class Story < ActiveRecord::Base
  attr_accessible :description, :owner_id, :requester_id, :state, :state_event, :title, :title_event

  belongs_to :requester, class_name: 'User'
  belongs_to :owner, class_name: 'User'

  state_machine :state, initial: :new do
    state :new
    state :started
    state :finished
    state :delivered
    state :accepted
    state :rejected

    event :start do
      transition :new => :started
    end

    event :finish do
      transition :started => :finished
    end

    event :accept do
      transition :finished => :accepted
    end

    event :reject do
      transition :finished => :rejected
    end

    event :restart do
      transition :rejected => :started
    end
  end
end
