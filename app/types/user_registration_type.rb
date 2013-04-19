class UserRegistrationType < User
  include BasicType

  attr_accessible :email, :password, :password_confirmation

  validates :password, presence: true
  validates :password_confirmation, presence: true
end
