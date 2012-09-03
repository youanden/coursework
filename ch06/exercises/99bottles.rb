# 99 Bottles of Beer
# Concierto 0
bottles = 99

while bottles != 1
  puts "#{bottles} bottles of beer on the wall, #{bottles} of beer."
  puts "Take one down and pass it around, #{bottles-1} of beer on the wall."
  bottles -= 1
end

puts "#{bottles} bottle of beer on the wall, #{bottles} bottle of beer."
puts "Take one down and pass it around, no more bottles of beer on the wall."
# Humerously superfluous
bottles -= 1
puts "No more bottles of beer on the wall, no more bottles of beer."
puts "Go to the store and buy some more, 99 bottles of beer on the wall."
bottles += 99
