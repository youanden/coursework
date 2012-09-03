# Sorted List program
list = []
while list.last != ''
  print 'Add to the list: '
  list.push gets.chomp.capitalize
end

list.pop # Removing the last newline carriage

sorted_list = list 

list[1..list.size].each_with_index do |val, i|
  list[0..i].reverse.each do |next_val|
    break if next_val < val
    sorted_list[i + 1] = next_val
    i -= 1
  end
  sorted_list[i + 1] = val
end

puts sorted_list
