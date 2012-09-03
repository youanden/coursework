var1 = 2
var2 = '5'
# Fails:
# puts var1 + var2
# Variation 1
puts var1.to_s + var2
# Variation 2
puts var1 + var2.to_i
puts '15'.to_f
puts '99.999'.to_f
puts '99.999'.to_i
puts ''
puts '5 is my favorite number!'.to_i
uts 'Who asked you about 5 or whatever?'.to_i
puts 'Your momma did.'.to_f
puts ''
puts 'stringy'.to_s
puts 3.to_i
puts 20
puts 20.to_s
puts '20'
puts gets
# Main Example:
puts 'Hello there, and what\'s your name?'
name = gets.chomp
puts 'Your name is ' + name + '?  What a lovely name!'
puts 'Pleased to meet you, ' + name + '.  :)'
