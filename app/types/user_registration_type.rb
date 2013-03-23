class UserRegistrationType < User
  include BasicType

  attr_accessible :email, :password, :password_confirmation

  validates :password, :password_confirmation, presence: true
end
