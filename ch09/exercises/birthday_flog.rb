puts "What year were you born in?"
year = gets.to_i
puts "What month were you born?"
month = gets.to_i
puts "What day were you born on?"
day = gets.to_i
age = Time.new.year - Time.mktime(year,month,day).year

if age > 1
  puts "You are #{age} years old!"
  age.times {  puts "SPANK*" } if age > 16
elsif age == 1
  puts "You are #{age} year old and can already use a computer?"
elsif age == 0
  puts "..."
else
  puts "Born in the future, eh?"
end
