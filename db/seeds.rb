if User.count == 0
  puts 'Seed users'
  User.create email: 'admin@users.com', role: :admin, password: 'admin'
  User.create email: 'user@users.com', role: :user, password: 'user'
end
