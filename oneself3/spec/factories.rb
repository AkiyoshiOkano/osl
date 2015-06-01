FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foooobar"
    password_confirmation "foooobar"
  end

  factory :paper do
    content "Lorem ipsum"
    user
  end
end