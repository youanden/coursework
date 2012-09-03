# Sorted List program
list = []
while list.last != ''
  print 'Add to the list: '
  list.push gets.chomp
end

list.pop # Removing the last newline carriage

list.sort.each do |item|
  puts item
end
