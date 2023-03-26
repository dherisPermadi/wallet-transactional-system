FactoryBot.define do
  factory :user do
    email { 'test-user@example.com' }
    first_name { 'Jordan' }
    last_name { 'Spark' }
    password { 'Pass@1234' }
  end
end
