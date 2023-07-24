require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...

print "Enter the name of the store: "
store_name = gets.chomp

store = Store.new(name: store_name)

if store.save
  puts "Store created successfully!"
else
  puts "Error(s) occurred while creating the store:"
  store.errors.full_messages.each do |message|
    puts message
  end
end
