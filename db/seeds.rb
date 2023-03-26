users = ['Jane Smith', 'Joe Rolland']

users.each do |name|
  first_name = name.split(" ").first
  last_name  = name.split(" ").second
  User.create(
    email: "#{first_name.downcase}_#{last_name.downcase}@example.com",
    first_name: first_name,
    last_name: last_name,
    password: 'Pass@1234'
  )
end
