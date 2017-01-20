namespace :fake do
  desc "Filling db with faking data"
  task fill: :environment do
    create_users
    create_tasks
  end

  def create_tasks(count = 50)
    puts "Creating #{count} tasks"
    users = User.all
    lib_path = Rails.root.join('lib')
    files = [lib_path.join('just-image.jpg'), lib_path.join('just-file.txt.gz')]
    count.times do
      Task.create name: Faker::Lorem.sentence,
                  description: Faker::Lorem.sentences(rand(4..8)).join(' '),
                  state: %w(new started finished).sample,
                  attachment: rand(0..1) ? files.sample.open : nil,
                  user: users.sample
    end
  end

  def create_users(count = 10)
    puts "Creating #{count} users"
    count.times do
      User.create name: Faker::Name.name,
                  email: Faker::Internet.email,
                  password: Faker::Internet.password,
                  role: :user
    end
  end
end
