namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(first_name: "Example",
                         last_name: "User",
                         email: "example@user.org",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)

    admin = User.create!(first_name: "Normal",
                         last_name: "Person",
                         email: "normal@person.org",
                         password: "foobar",
                         password_confirmation: "foobar")

    99.times do |n|
      first_name  = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = "example-#{n+1}@user.org"
      password  = "password"
      User.create!(first_name: first_name,
                   last_name: last_name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end