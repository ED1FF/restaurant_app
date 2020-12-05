# frozen_string_literal: true
require 'faker'

Constants::Cities::UKRAINE.each { |city_name| City.create(country: 'Ukraine', name: city_name) }
User.create(first_name: 'Alex', last_name: 'Karp', password: 123321123, email: 'admin@admin.admin', admin: true, phone_number: Faker::Number.number(digits: 10))

30.times do
  r = Restaurant.create(name: Faker::Restaurant.name, description: Faker::Restaurant.description, city_id: City.ids.sample)
  10.times do
    Item.create(name: Faker::Food.dish, description: Faker::Food.description, cost: Faker::Number.number(digits: 2), restaurant: r)
  end
end