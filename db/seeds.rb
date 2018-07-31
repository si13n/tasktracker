# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3000.times do
    Task.create(
        summary:        Faker::ChuckNorris.fact,
        description:    Faker::Community.quotes,
        dev:            Faker::Number.between(1,8),
        tst:            Faker::Number.between(1,8),
        tst_est:        Faker::Number.between(1,48),
        dev_est:        Faker::Number.between(1,72),
        project:        Faker::Number.between(1,5),
        status:         Task.status.sample.to_s,
        priority:       Task.priority.sample.to_s,
        )
    end

100.times do
    User.create(
        name:     Faker::Name.name,
        email:    Faker::Internet.email,
        role:     User.roles.sample.to_s,
        team_id:  Faker::Number.between(2,6),
        password: "qwerty",
        password_confirmation: "qwerty",
        )
    end
