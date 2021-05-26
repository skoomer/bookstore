FactoryBot.define do
  factory :admin_user do
    email { FFaker::Internet.email }
    password { FFaker::String.from_regexp(User::PASSWORD_FORMAT_REGEX) }

  end
end
