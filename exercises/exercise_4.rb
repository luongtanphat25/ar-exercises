require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ...

surrey = Store.create(
  name: 'Surrey',
  annual_revenue: 224000,
  mens_apparel: false,
  womens_apparel: true
)


whistler = Store.create(
  name: 'Whistler',
  annual_revenue: 1900000,
  mens_apparel: true,
  womens_apparel: false
)

yaletown = Store.create(
  name: 'Yaletown',
  annual_revenue: 430000,
  mens_apparel: true,
  womens_apparel: true
)

@men_stores = Store.where(mens_apparel: true, womens_apparel: false)
@men_stores.each {|s|
  puts "#{s.name}'s annual revenue: #{s.annual_revenue}"
}

@others = Store.where(womens_apparel: true).where('annual_revenue < ?', 1000000)
@others.each{|o|
  puts "#{o.name}'s annual revenue: #{o.annual_revenue}"
}