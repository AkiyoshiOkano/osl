FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foooobar"
    password_confirmation "foooobar"
  end

  factory :paper do
    content "Lorem ipsum"
    user
  end
end