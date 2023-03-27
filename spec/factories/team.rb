FactoryBot.define do
  factory :team do
    email { 'test-team@example.com' }
    name { 'Team Lte' }
    password { 'Pass@1234' }
  end
end
