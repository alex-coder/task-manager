if User.count == 0
  puts 'Seed users'
  User.create name: 'Admin', email: 'admin@users.com', role: :admin, password: 'admin'
  User.create name: 'User', email: 'user@users.com', role: :user, password: 'user'
end
