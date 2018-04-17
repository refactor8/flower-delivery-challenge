# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bouquets = [{name: 'Alice', price: 20}, {name: 'Charlotte', price: 22.5}, {name: 'Isabel', price: 30}]

bouquets.each do |b|
  Bouquet.create!(b)
end