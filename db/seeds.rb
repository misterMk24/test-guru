require 'faker'

10.times { User.create!(username: Faker::Name.first_name) }

["football", "basketball", "rock_music"].each { |cat| Category.create!(title: cat) }

10.times { Test.create!(title: Faker::Sports::Football.player, level: rand(0..2),
  category_id: Category.find_by(title: "football").id) }

10.times { Test.create!(title: Faker::Sports::Basketball.team, level: rand(0..2),
  category_id: Category.find_by(title: "basketball").id) }

10.times { Test.create!(title: Faker::Music::RockBand.name, level: rand(0..2),
  category_id: Category.find_by(title: "rock_music").id) }
