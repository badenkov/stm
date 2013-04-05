FactoryGirl.define do
  sequence :email do |n|
    "email_#{n}@mail.com"
  end

  sequence :title do |n|
    "Title #{n}"
  end

  sequence :description do |n|
    "Description #{n}"
  end
end
