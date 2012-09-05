# Simple Pawn Shop
# Length of the command window
iwidth = 90

# General Item? Product? Vehicle? etc...
$item_prefix = "Item"

# List of products
$items = [
  ['1977 Apple II', 80],
  ['baseball signed by Babe Ruth', 50],
  ['copy of the 1974 games Oregon Trail', 10],
  ['Louisville Slugger owned by Babe Ruth', 500],
  ['Complete set of Superman comic books', 100],
  ['original IBM Model M keyboard', 15],
  ['paper copy of Chris Pine\'s Learn to Program book', 20],
  ['leaked pre-release iPhone 5', 5000]
]
cart = []

# Calculate the literal length of the amount of items (e.g. 10 = 2)
prefix = Struct.new(:length).new($item_prefix.length + $items.count.to_s.length)


# List Items Initially
$items.each_with_index do |item,index|
  # Initialize some local variables with the values for easier reading
  iteration = "#{$item_prefix} #{index+1}: "
  item_name = item[0]
  item_price = "$#{item[1]}"
  # Spacer represents the length of the ...'s up to the price without breaking rythm. 
  spacer = iwidth - prefix.length - item_name.length - item_price.length
  print iteration.ljust(prefix.length)
  print item_name.ljust(item.length)
  print "." * spacer
  print item_price.rjust(item_price.length)
  print "\n"
end
# List available commands
puts 'Available Commands'.center(100)

def list_commands(commands)
  commands.each do |command|
    if command == 'add'
      puts "'Add' #{$item_prefix} to your shopping cart"
    elsif command == 'remove'
      puts "'Remove' #{$item_prefix} from your shopping cart"
    elsif command == 'buy'
      puts "'Buy' the #{$item_prefix}s in your shopping cart"
    elsif command == 'cart'
      puts "Shows you the #{$item_prefix}s in your shopping 'cart'"
    elsif command == 'commands'
      puts "List the available 'commands'"
    elsif command == 'exit'
      puts "'exit' the program"
    end
  end
end

# Helper method
class Array
  def included_in?(array)
    array.to_set.superset?(self.to_set)
  end
end

def add_item(index)
  cart.push $items[index]
  puts "#{$items[index][0]} has been added to your shopping cart"
end



def buy(cart)
  cart.included_in? $items
end

# Command Initialization
commands = ['add','remove','buy','cart','commands','exit']
list_commands(commands)
# Wait for a command
while true
  print '> '
  command = gets.chomp.downcase
  clist = command.split
  command = clist[0]
  # Reset the command if the format is wrong
  command = '' unless ($items.include?(command)) || clist[2].nil?

  itemid = clist[2].to_i - 1

  if command == 'add'
    cart.push $items[itemid]
    puts "#{$items[itemid][0]} has been added to the cart."
  elsif command == 'remove'
    cart.delete $items[itemid]
    puts "#{$items[itemid][0]} has been removed from the cart."
  elsif command == 'buy'
    buy cart
  elsif command == 'cart'
    total = 0
    cart.each do |item|
      puts "#{item[0]} for $#{item[1]}"
      total += item[1].to_i
    end
    puts "Total $#{total}"
  elsif command == 'commands'
    list_commands commands
  elsif command == 'exit'
    exit
  else
    puts 'Command not found. Type \'commands\' to see the available commands'
  end
end

