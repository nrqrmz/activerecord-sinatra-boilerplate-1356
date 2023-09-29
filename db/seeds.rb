require 'faker'

10.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    city: Faker::Address.city
  )
end
