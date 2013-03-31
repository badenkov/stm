class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}, email: true

  has_many :stories, class_name: 'Story', foreign_key: 'owner_id'
  has_many :requested_stories, class_name: 'Story', foreign_key: 'requester_id'
end
