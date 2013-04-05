# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :comment_body do |n|
    "Comment body #{n}"
  end

  factory :comment do
    body { generate :comment_body }
  end
end
