# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
    House.destroy_all
    house = House.create!(address: '308 Negra Arroyo Lane')
    Person.destroy_all
    person = Person.create!(name: 'Walter White', house_id: house.id)
end
