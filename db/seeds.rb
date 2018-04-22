# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bouquets = [{name: 'Alice', price: 20}, {name: 'Charlotte', price: 22.5}, {name: 'Isabel', price: 30}]
shipping_methods = [{name: 'Standard Delivery', price: 2.5}, {name: 'Special Delivery', price: 5}]

bouquets.each do |b|
  Bouquet.create!(b)
end

shipping_methods.each do |s|
  ShippingMethod.create!(s)
end
